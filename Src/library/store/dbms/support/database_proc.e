
note
	description: "Implementation of DB_PROC"
	legal: "See notice at end of class."
	status: "See notice at end of class.";
	date: "$Date$"
	revision: "$Revision$"

class
	DATABASE_PROC [G -> DATABASE create default_create end]
inherit

	HANDLE_USE

	HANDLE_SPEC [G]

create -- Creation procedure

	make

feature -- Initialization

	make
			-- If the database has row numbers
			-- initialize `row_number'
		do
			if db_spec.has_row_number then
				row_number := 0
			end
		end

feature -- Status report

	text: STRING
			-- SQL statement attached to stored procedure
		local
			tuple: DB_TUPLE
			seq: INTEGER
			tmp_text: STRING
			row_text: STRING
		do
			if db_spec.support_sql_of_proc then
     				private_selection.set_map_name (name, "name")
				if db_spec.has_row_number then
					create tmp_text.make(1024)
					from
						seq := 1
					until
						seq > row_number
					loop
       					private_selection.set_map_name (seq , "seq")
     					private_selection.query (Select_text (name))
     					private_selection.load_result
     					private_selection.unset_map_name ("seq")
     					create tuple.copy (private_selection.cursor)
     					row_text ?= tuple.item (1)
     					tmp_text.append(row_text)
						seq := seq + 1
					end

				else
					private_selection.query (Select_text (name))
					private_selection.load_result
					create tuple.copy (private_selection.cursor)
					tmp_text ?= tuple.item (1)
				end
				private_selection.unset_map_name ("name")
				Result := tmp_text
				private_selection.terminate
			else
				Result := db_spec.text_not_supported
			end
		end

	arguments_name: ARRAY [STRING]
			-- Argument names of stored procedure

	arguments_type: ARRAY [ANY]
			-- Argument types of stored procedure

feature -- Basic operations

	load
			-- Make result of stored procedure execution available.
			-- Activate current stored procedure from server
			-- so that presence may be accurately tested using `exists'.
		do
			set_p_exists
		end

	store (sql: STRING)
			-- Store current procedure performing `sql' statement.
		require else
			argument_not_void: sql /= Void
		local
			sql_temp: STRING
		do
			if db_spec.support_stored_proc then
				sql_temp := db_spec.sql_adapt_db (sql)
				private_string.wipe_out
				private_string.append(db_spec.sql_creation)
				private_string.append(name)
				if arguments_set then
					append_in_args_type (private_string)
				end
				private_string.append (db_spec.sql_as)
				private_string.append (sql_temp)
				private_string.append (db_spec.sql_end)
				private_change.modify (private_string)
			else
				db_spec.store_proc_not_supported
			end
		end

	execute (destination: DB_EXPRESSION)
			-- Execute current procedure with `destination'
			-- as a DB_SELECTION or a DB_CHANGE object mapping
			-- entity values with procedure parameter names
			-- if any.
		require else
			argument_not_void: destination /= Void
		do
			if db_spec.support_proc then
				private_string.wipe_out
				private_string.append (db_spec.sql_execution)
				private_string.append (proc_name)

				if arguments_set then
					append_in_args_value (private_string)
				end
				private_string.append (db_spec.sql_after_exec)
				destination.set_query (private_string)
				destination.execute_query
			else
				db_spec.exec_proc_not_supported
			end
		end

	execute_string (destination: DB_EXPRESSION; sql: STRING)
			-- Execute the procedure using the sql statement `sql'
		do
			private_string.wipe_out
			private_string.append (sql)
			destination.set_query (private_string)
			destination.execute_query
		end

	drop
			-- Drop current procedure from server.
		do
			if db_spec.support_drop_proc then
				private_string.wipe_out
				private_string.append ("drop procedure ")
				private_string.append (name)
				if (handle.execution_type.immediate_execution) then
					private_change.modify (private_string)
				else
						-- Does not work with Oracle.
	--				handle.execution_type.set_immediate
					private_change.modify (private_string)
	--				handle.execution_type.unset_immediate
				end
			else
				db_spec.drop_proc_not_supported
			end
		end

feature -- Status report

	exists: BOOLEAN
			-- Does current procedure exist in server?
		do
			Result := p_exists
		end

	arguments_set: BOOLEAN
			-- Have arguments been set?
		do
			Result := (arguments_name /= Void and arguments_type /= Void)
		ensure
			arguments_set: Result implies
								(arguments_name /= Void and arguments_type /= Void)
		end

feature -- Element change

	change_name (new_name: STRING)
			-- Change procedure name with `new_name'.
		do
			name := new_name
			if db_spec.name_proc_lower then
				name.to_lower
			end
		ensure then
			name_changed: name = new_name
		end

	set_arguments (args_name: like arguments_name;
			 			args_type: like arguments_type)
			-- Set `arguments_name' and `arguments_type'
			-- of current as a variable list of argument
			-- names and a variable list of argument
			-- types, respectively.
		require
			args_name_not_void: args_name /= Void
			args_type_not_void: args_type /= Void
			not_arguments_set: not arguments_set
		do
			arguments_name := args_name
			arguments_type := args_type
		ensure
			arguments_set
			set_with_input_parameter1: arguments_name = args_name
			set_with_input_parameter2: arguments_type = args_type
		end

	set_no_arguments
			-- No arguments for the current procedure.
		do
			arguments_type := Void
			arguments_name := Void
		ensure
			arguments_type_void: arguments_type = Void
			arguments_name_void: arguments_name = Void
			no_arguments: not arguments_set
		end

feature {NONE} -- Implementation

	set_p_exists
			-- Set `p_exists'.
		local
			temp_int: INTEGER_REF
			temp_dble: DOUBLE_REF
			temp_string: STRING
			tuple: DB_TUPLE
		do
			if db_spec.support_proc then
				private_selection.set_map_name (name, "name")
				private_selection.query (Select_exists)
				p_exists := handle.status.found
				private_selection.load_result
				private_selection.unset_map_name ("name")
				create tuple.copy (private_selection.cursor)
				if not tuple.is_empty then
					temp_int ?= tuple.item (1)
					if temp_int /= Void then
						p_exists := temp_int > 0
						if db_spec.has_row_number then
							row_number := temp_int.item
						end
					else
						temp_dble ?= tuple.item (1)
						if temp_dble /= Void then
							p_exists := temp_dble > 0.0
							if db_spec.has_row_number then
								row_number := temp_dble.item.truncated_to_integer
							end
						else
								-- Added for ODBC, should really be abstracted
							temp_string ?= tuple.item (3)
							p_exists := temp_string /= Void and then not temp_string.is_empty

						end
					end
				else
					p_exists := False
				end
				private_selection.terminate
			end
		end

	p_exists: BOOLEAN
			-- Does procedure exist?
			-- Value is effective after `set_p_exists'
			-- execution.

	append_in_args_value (s: STRING)
			-- Append map variables name from `d' in `s'.
			-- Map variables are used for set input arguments.
		require
			s_not_void: s /= Void
		local
			i: INTEGER
		do
			s.append (db_spec.map_var_before)
			from
				i := arguments_name.lower
			until
				i > arguments_name.upper
			loop
				if db_spec.proc_args then
					s.append (db_spec.map_var_between)
					s.append (arguments_name.item (i))
					s.append (" = ")
				end
				s.append (db_spec.map_var_name (arguments_name.item (i)))
				i := i + 1
				if i <= arguments_name.upper then
					s.extend (',')
				end
			end
			s.append (db_spec.map_var_after)
		ensure
			s_larger: s.count > old s.count
		end

	append_in_args_type (s: STRING)
			-- Append arguments type name in `s'.
		require
			s_not_void: s /= Void
			arguments_set: arguments_set
		local
			i: INTEGER
		do
			s.append (db_spec.map_var_before)
			from
				i := arguments_name.lower
			until
				i > arguments_name.upper
			loop
				s.append (db_spec.map_var_between)
				s.append (arguments_name.item (i))
				s.append (db_spec.map_var_between_2)
				s.append (handle.all_types.db_type (arguments_type.item (i)).sql_name)
				i := i + 1
				if i <= arguments_name.upper then
					s.extend (',')
				end
			end
			s.append (db_spec.map_var_after)
		ensure
			s_larger: s.count > old s.count
		end

feature {NONE} -- Status report

	row_number: INTEGER
			-- record the number of segments into which the stored
			-- procedure is divided by INGRES

	name: STRING
			-- Stored procedure name

	qualifier: STRING
			-- the qualifier of the procedure

	owner: STRING
			-- the owner of the procedure

	proc_name: STRING
			-- Name of the procedure
		local
			quoter: STRING
			sep: STRING
		do
			create Result.make (100)

			create quoter.make(1)
			create sep.make(1)
			quoter := db_spec.identifier_quoter
			sep := db_spec.qualifier_seperator
			if (qualifier /= Void and then qualifier.count > 0) then
				Result.append(quoter)
				Result.append(qualifier)
				Result.append(quoter)
			end
			if (owner /= Void and then owner.count > 0) then
				Result.append(sep)
				Result.append(quoter)
				Result.append(owner)
				Result.append(quoter)
			end
			if ((owner /= Void and then owner.count > 0) or (qualifier /= Void and then qualifier.count > 0)) then
				Result.append(".")
			end
			Result.append(quoter)
			Result.append(name)
			Result.append(quoter)
		end

	private_selection: DB_SELECTION
			-- Shared local object
		once
			create Result.make
		ensure
			result_not_void: Result /= Void
		end

	private_change: DB_CHANGE
			-- Shared local object
		once
			create Result.make
		ensure
			result_not_void: Result /= Void
		end

	private_string: STRING
			-- Constant string
		once
			create Result.make (50)
		ensure
			result_not_void: Result /= Void
		end

	Select_text (a_proc_name: STRING): STRING
			-- SQL query to get procedure text.
		do
			Result := db_spec.Select_text (a_proc_name)
		end

	Select_exists: STRING
			-- SQL query to test procedure existing.
		do
			Result := db_spec.Select_exists (name)
		end

note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"




end -- class DATABASE_PROC


