indexing
	description: "Class representing the object tool generator %
				% which allows the user to build an object %
				% tool for a specific class."
	date: "$Date$"
	id: "$Id$"
	revision: "$Revision$"

class
	OBJECT_TOOL_GENERATOR

inherit

	EB_TOP_SHELL
		redefine
			make
		end

	SHARED_CLASS_IMPORTER

	CLOSEABLE

	COMMAND

	COMMAND_ARGS

creation

	make

feature -- Creation

	make (a_name: STRING; a_screen: SCREEN) is
			-- Create the object tool generator.
		do
			{EB_TOP_SHELL} Precursor (a_name, a_screen)
			!! split_window.make_horizontal ("", Current)
			!! top_form.make ("", split_window)
			!! bottom_form.make ("", split_window)
			!! arrow_form.make ("", top_form)
			!! include_label.make ("Include", arrow_form)
			!! include_all_label.make ("Include all", arrow_form)
			!! exclude_label.make ("Exclude", arrow_form)
			!! exclude_all_label.make ("Exclude all", arrow_form)
			!! include_button.make ("", arrow_form)
			!! include_all_button.make ("", arrow_form)
			!! exclude_button.make ("", arrow_form)
			!! exclude_all_button.make ("", arrow_form)
			!! excluded_label.make ("Excluded queries", top_form)
			!! included_label.make ("Included queries", top_form)
			!! included_list.make ("", top_form)
			!! excluded_list.make ("", top_form)
--			!! default_label.make ("Default:", arrow_form)
--			!! select_radio_box.make ("", arrow_form)	
--			!! precondition_test.make("Test preconditions", select_radio_box)
--			!! no_precondition_test.make ("No preconditions test", select_radio_box)
			!! scrolled_w.make ("", bottom_form)
			!! separator.make ("", bottom_form)
			!! properties_rc.make ("", scrolled_w)
			!! generate_button.make ("Generate", bottom_form)
			set_values
			attach_all
			set_callbacks
			!! form_table.make (10)
		end

	set_values is
			-- Set values for GUI elements.
		local
			set_colors: SET_WINDOW_ATTRIBUTES_COM
			temp_title: STRING
		do
			set_title ("Object tool generator: ")
			set_size (resources.object_tool_generator_width, resources.object_tool_generator_height)
			set_x_y (resources.object_tool_generator_x, resources.object_tool_generator_y)
			split_window.set_proportion (20)
			include_button.set_down
			include_all_button.set_down
			exclude_button.set_up
			exclude_all_button.set_up
			included_list.set_multiple_selection
			excluded_list.set_multiple_selection
--			precondition_test.arm
			scrolled_w.set_working_area (properties_rc)
			!! set_colors
			set_colors.execute (Current)
		end

	attach_all is
			-- Perform attachments.
		do
			arrow_form.attach_top (include_button, 15)
			arrow_form.attach_top (include_label, 18)
			arrow_form.attach_left (include_button, 2)
			arrow_form.attach_left_widget (include_button, include_label, 3)
			arrow_form.attach_right (include_label, 2)

			arrow_form.attach_top_widget (include_button, exclude_button, 5)
			arrow_form.attach_top_widget (include_label, exclude_label, 13)
			arrow_form.attach_left (exclude_button, 2)
			arrow_form.attach_left_widget (exclude_button, exclude_label, 3)
			arrow_form.attach_right (exclude_label, 2)

			arrow_form.attach_top_widget (exclude_button, include_all_button, 10)
			arrow_form.attach_top_widget (exclude_label, include_all_label, 18)
			arrow_form.attach_left (include_all_button, 2)
			arrow_form.attach_left_widget (include_all_button, include_all_label, 3)
			arrow_form.attach_right (include_all_label, 2)

			arrow_form.attach_top_widget (include_all_button, exclude_all_button, 5)
			arrow_form.attach_top_widget (include_all_label, exclude_all_label, 13)
			arrow_form.attach_left (exclude_all_button, 2)
			arrow_form.attach_left_widget (exclude_all_button, exclude_all_label, 3)
			arrow_form.attach_right (exclude_all_label, 2)

			arrow_form.attach_bottom (exclude_all_button, 0)
			arrow_form.attach_bottom (exclude_all_label, 0)

			top_form.set_fraction_base (5)
			top_form.attach_top (excluded_label, 0)
			top_form.attach_top (arrow_form, 0)
			top_form.attach_top (included_label, 0)
			top_form.attach_left (excluded_label, 0)
			top_form.attach_right_position (excluded_label, 2)
			top_form.attach_left_position (arrow_form, 2)
			top_form.attach_right_position (arrow_form, 3)
			top_form.attach_left_position (included_label, 3)
			top_form.attach_right (included_label, 0)

			top_form.attach_top_widget (excluded_label, excluded_list, 5)
			top_form.attach_left (excluded_list, 3)
			top_form.attach_right_position (excluded_list, 2)
			top_form.attach_bottom (excluded_list, 0)

			top_form.attach_top_widget (included_label, included_list, 5)
			top_form.attach_left_position (included_list, 3)
			top_form.attach_right (included_list, 3)
			top_form.attach_bottom (included_list, 0)

			bottom_form.attach_top (scrolled_w, 0)
			bottom_form.attach_left (scrolled_w, 3)
			bottom_form.attach_right (scrolled_w, 3)
			bottom_form.attach_bottom_widget (separator, scrolled_w, 0)
			bottom_form.attach_left (separator, 0)
			bottom_form.attach_right (separator, 0)
			bottom_form.attach_bottom_widget (generate_button, separator, 0)
			bottom_form.attach_bottom (generate_button, 0)
			bottom_form.attach_right (generate_button, 3)
		end

	set_callbacks is
			-- Set the GUI elments callbacks.
		local
			del_com: DELETE_WINDOW
			generate_cmd: GENERATE_OBJECT_TOOL_CMD
		do
			include_button.add_activate_action (Current, First)
			include_all_button.add_activate_action (Current, Second)
			included_list.add_default_action (Current, Third)
			exclude_button.add_activate_action (Current, Third)
			exclude_all_button.add_activate_action (Current, Fourth)
			excluded_list.add_default_action (Current, First)
			!! generate_cmd.make
			generate_button.add_activate_action (generate_cmd, Void)
			!! del_com.make (Current)
			set_delete_command (del_com)
		end

feature {NONE} -- GUI attributes

	split_window: SPLIT_WINDOW	
			-- Form of the top shell itself

	top_form,
			-- Top form of the split window

	bottom_form: SPLIT_WINDOW_CHILD
			-- Bottom form of the split window

	arrow_form: FORM
			-- Form containing the arrows

	excluded_label,
			-- Excluded attribute label

	included_label,
			-- Included attribute label

	include_label,
			-- Include button label

	include_all_label,
			-- Include all button label

	exclude_label,
			-- Exclude button label

	exclude_all_label: LABEL
			-- Exclude all button label

--	default_label: LABEL
			-- default label	

	include_button,
			-- Include button

	include_all_button,
			-- Include all button

	exclude_button,
			-- Exclude button

	exclude_all_button: ARROW_B
			-- Exclude all button

--	select_radio_box: RADIO_BOX
			-- Radio box used to select the preconditions test by default

	scrolled_w: SCROLLED_W
			-- Scrolled window containing the various properties

	properties_rc: ROW_COLUMN
			-- Row column containing the list of element composing
			-- the interface of the object editor

	generate_button: PUSH_B
			-- `Generate' button

	included_list,
			-- List of included queries

	excluded_list: SCROLLABLE_LIST
			-- List of excluded queries
	
	separator: THREE_D_SEPARATOR
			-- Separators between the `scrolled_w' and the `generate_button' 

-- feature {QUERY_EDITOR_FORM}

--	no_precondition_test,
			-- No preconditions test by default field

--	precondition_test: TOGGLE_B
			-- Preconditions test by default field


feature -- Command execution

	execute (arg: ANY) is
		local
			mp: MOUSE_PTR
		do
			!! mp
			mp.set_watch_shape
			if arg = First then
				include_queries
			elseif arg = Second then
				include_all_queries
			elseif arg = Third then
				exclude_queries
			elseif arg = Fourth then
				exclude_all_queries
			end
			mp.restore
		end

	include_queries is
			-- Include selected queries.
		do
			move_items (excluded_list, included_list)
		end



	include_all_queries is
			-- Include all queries.
		do
			move_all_items (excluded_list, included_list)
		end

	exclude_queries is
			-- Exclude selected queries.
		do
			move_items (included_list, excluded_list)
		end

	exclude_all_queries is
			-- Exclude all queries.
		do
			move_all_items (included_list, excluded_list)
			properties_rc.set_size (0, 0)
		end

	move_items (source_list, target_list: SCROLLABLE_LIST) is
			-- Move selected items of `source_list' into
			-- `target_list'.
		local
			selected_items: LINKED_LIST [SCROLLABLE_LIST_ELEMENT]
			removed: BOOLEAN
			a_query: APPLICATION_QUERY
		do
			if source_list.selected_count > 0 then
				selected_items := source_list.selected_items
				from
					selected_items.start
				until
					selected_items.after
				loop
					target_list.extend (selected_items.item)
					a_query ?= selected_items.item
					if a_query /= Void then
						if target_list = included_list then
							add_query_editor_form (a_query)
						else
							remove_query_editor_form (a_query)
						end
					end
					from
						source_list.start
						removed := False
					until
						removed or source_list.after
					loop
						if selected_items.item = source_list.item then
							removed := True
							source_list.remove
						else
							source_list.forth
						end
					end
					selected_items.forth
				end
			end
			properties_rc.manage
		end

	move_all_items (source_list, target_list: SCROLLABLE_LIST) is
			-- Move all items from `source_list' into
			-- `target_list'.
		local
			a_query: APPLICATION_QUERY
		do
			if source_list.count > 0 then
				from
					source_list.start
				until
					source_list.after
				loop
					target_list.extend (source_list.item)
					a_query ?= source_list.item
					if a_query /= Void then
						if target_list = included_list then
							add_query_editor_form (a_query)
						else
							remove_query_editor_form (a_query)
						end
					end
					source_list.forth
				end
				source_list.wipe_out
			end
			properties_rc.manage
		end

	add_query_editor_form (a_query: APPLICATION_QUERY) is
			-- Add a form to edit `a_query' properties.
		require
			query_not_void: a_query /= Void
		local
			any_editor_form: ANY_QUERY_EDITOR_FORM
			boolean_editor_form: BOOLEAN_QUERY_EDITOR_FORM
			new_height: INTEGER
		do
			if form_table.has (a_query.query_name) and form_table.item (a_query.query_name) /= Void then
				new_height := properties_rc.height + form_table.item (a_query.query_name).height
				form_table.item (a_query.query_name).manage
			else
				new_height := properties_rc.height
				if a_query.query_type.is_equal ("BOOLEAN") then
					!! boolean_editor_form.make ("", properties_rc)
					boolean_editor_form.set_query (a_query)
					form_table.force (boolean_editor_form, a_query.query_name)
					new_height := new_height + boolean_editor_form.height
				else
					!! any_editor_form.make ("", properties_rc)
					any_editor_form.set_query (a_query)
					form_table.force (any_editor_form, a_query.query_name)
					new_height := new_height + any_editor_form.height
				end
			end
			properties_rc.set_size (properties_rc.width, new_height)
		end

	remove_query_editor_form (a_query: APPLICATION_QUERY) is
			-- Remove a form from the set of properties.
		require
			query_not_void: a_query /= Void
			item_referenced: form_table.has (a_query.query_name)
		local
			new_height: INTEGER
		do
			new_height := properties_rc.height - form_table.item (a_query.query_name).height
			form_table.item (a_query.query_name).unmanage
			properties_rc.set_size (properties_rc.width, new_height)
		end
feature -- Closeable

	close is
			-- Close object tool generator.
		do
			hide
		end

	display (application_class: SCROLLABLE_LIST_ELEMENT) is
			-- Display object tool generator.
		require
			class_not_void: application_class /= Void
		local	
			mp: MOUSE_PTR
			previous_class: APPLICATION_CLASS	
		do
			!! mp
			mp.set_watch_shape
			previous_class := edited_class
			edited_class ?= application_class
			check
				edited_class_not_void: edited_class /= Void
			end
			if not realized then
				realize
			else
				show
			end
			if previous_class = Void or else not edited_class.class_name.is_equal (previous_class.class_name) then
				update_interface
			end
			mp.restore
			raise
		end

feature {NONE} -- Implementation

	update_interface is
			-- Update the interface according to the new application
			-- class that is edited.
		require
			edited_class_not_void: edited_class /= Void
		local
			query_list: LINKED_LIST [APPLICATION_QUERY]
			temp_title: STRING
			a_query: APPLICATION_QUERY
		do
			!! temp_title.make (0)
			temp_title.append ("Object tool generator: ")
			temp_title.append (edited_class.class_name)
			set_title (temp_title)
			exclude_all_queries
			excluded_list.wipe_out
			included_list.wipe_out
			query_list := edited_class.query_list
			from
				query_list.start
			until
				query_list.after
			loop
				a_query ?= query_list.item
				if a_query /= Void then
					add_query_editor_form (a_query)
					included_list.extend (a_query)
				end
				query_list.forth
			end
		end

feature -- Attributes

	edited_class: APPLICATION_CLASS
			-- Currently edited application class

	form_table: HASH_TABLE [QUERY_EDITOR_FORM, STRING]
			-- Hash-table containing all the created 
			-- QUERY_EDITOR_FORM

end -- class OBJECT_TOOL_GENERATOR
