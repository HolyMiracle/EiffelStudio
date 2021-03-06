note
	description: "Eiffel type whose source code is to be generated"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$$"
	revision: "$$"

class
	CODE_GENERATED_TYPE

inherit
	CODE_NAMED_ENTITY
		redefine
			is_equal
		end

	CODE_SHARED_INHERITANCE_CLAUSE_PARSER
		export
			{NONE} all
		redefine
			is_equal
		end

create
	make

feature {NONE} -- Initialization

	make (a_type: CODE_TYPE_REFERENCE)
			-- | Call Precursor {CODE_TYPE}
			-- Initialize attributes
		do
			name := a_type.name
			eiffel_name := a_type.eiffel_name
			create {ARRAYED_LIST [CODE_INDEXING_CLAUSE]} indexing_clauses.make (4)
			create {ARRAYED_LIST [CODE_GENERIC_PARAMETER]} generic_parameters.make (4)
			create parents.make (4)
			create creation_routines.make (1)
			create features.make (20)
			create dotnet_features.make (20)
			create implementation_features.make (20)
		ensure
			name_set: name /= Void
			eiffel_name_set: eiffel_name /= Void
			attached_indexing_clauses: indexing_clauses /= Void
			attached_generic_parameters: generic_parameters /= Void
			attached_parents: parents /= Void
			attached_creation_routines: creation_routines /= Void
			attached_features: features /= Void
			attached_dotnet_features: dotnet_features /= Void
			attached_implementation_features: implementation_features /= Void
		end

feature -- Access

	eiffel_name: STRING
			-- Eiffel name

	is_expanded: BOOLEAN
			-- Is type expanded?
		do
		end

	indexing_clauses: LIST [CODE_INDEXING_CLAUSE]
			-- Type indexing clauses

	generic_parameters: LIST [CODE_GENERIC_PARAMETER]
			-- Generic parameters

	is_partial: BOOLEAN
			-- Is class partial?

	parents: CODE_PARENT_COLLECTION
			-- List of parents
			-- Key is parent Eiffel name

	creation_routines: HASH_TABLE [CODE_CREATION_ROUTINE, STRING]
			-- Type creation routines
			-- Key is eiffel creation routine name

	dotnet_features: HASH_TABLE [LIST [CODE_FEATURE], STRING]
			-- Features grouped by .NET name
			-- Value: feature
			-- Key: .NET feature name

	features: HASH_TABLE [CODE_FEATURE, STRING]
			-- Type features
			-- Value: feature
			-- Key: feature eiffel name

	implementation_features: HASH_TABLE [CODE_TRY_CATCH_IMPLEMENTATION_FEATURE, STRING]
			-- Type implementation features
			-- These features are added during code generation
			-- Value: feature
			-- Key: feature name

	all_features: HASH_TABLE [CODE_FEATURE, STRING]
			-- Features including creation routines
		local
			l_features, l_creation_routines: HASH_TABLE [CODE_FEATURE, STRING]
		do
			l_features := features
			l_creation_routines := creation_routines
			create Result.make (l_features.count + l_creation_routines.count)
			from
				l_features.start
			until
				l_features.after
			loop
				Result.put (l_features.item_for_iteration, l_features.key_for_iteration)
				l_features.forth
			end
			from
				l_creation_routines.start
			until
				l_creation_routines.after
			loop
				Result.put (l_creation_routines.item_for_iteration, l_creation_routines.key_for_iteration)
				l_creation_routines.forth
			end
		end

	parent (a_name: STRING): CODE_PARENT
			-- Parent with full Eiffel name `a_name' if any
		require
			attached_name: a_name /= Void
		do
			parents.search (a_name)
			if parents.found then
				Result := parents.found_item
			end
		end

	snippet_inherit_clause: STRING
			-- Snippet inherit clause

	code: STRING
			-- | Call `header', `body' and `footer' successively.
			-- Eiffel code of type
		local
			l_header, l_body, l_footer: STRING
		do
			set_current_generated_type (Current)
			l_body := body
			l_header := header
			l_footer := footer
			create Result.make (l_body.count + l_header.count + l_footer.count)
			Result.append (l_header)
			Result.append (l_body)
			Result.append (l_footer)
			set_current_generated_type (Void)
		end

	direct_parent (a_parent: CODE_TYPE_REFERENCE): CODE_TYPE_REFERENCE
			-- Direct parent which is or inherits from `a_parent'
		local
			l_is_external: BOOLEAN
			l_external_type: SYSTEM_TYPE
			l_parent_type: CODE_TYPE_REFERENCE
		do
			parents.search (a_parent.eiffel_name)
			if parents.found then
				Result := parents.found_item.type
			else
				Resolver.search (a_parent)
				l_is_external := not Resolver.found
				if l_is_external then
					l_external_type := a_parent.dotnet_type
				end
				from
					parents.start
				until
					parents.after or Result /= Void
				loop
					l_parent_type := parents.item_for_iteration.type
					Resolver.search (l_parent_type)
					if Resolver.found and then Resolver.found_type.is_parent (a_parent) then
						Result := l_parent_type
					elseif l_is_external then
						if l_parent_type.dotnet_type.is_subclass_of (l_external_type) then
							Result := l_parent_type
						end
					end
					parents.forth
				end
			end
		end

	is_parent (a_parent: CODE_TYPE_REFERENCE): BOOLEAN
			-- Is `a_parent' a direct or indirect parent?
		local
			l_parent_type: CODE_TYPE_REFERENCE
			l_external_type: SYSTEM_TYPE
			l_is_external: BOOLEAN
		do
			Result := parents.has (a_parent.eiffel_name)
			if not Result then
				Resolver.search (a_parent)
				l_is_external := not Resolver.found
				if l_is_external then
					l_external_type := a_parent.dotnet_type
				end
				from
					parents.start
				until
					parents.after or Result
				loop
					l_parent_type := parents.item_for_iteration.type
					Resolver.search (l_parent_type)
					if Resolver.found then
						Result := Resolver.found_type.is_parent (a_parent)
					elseif l_is_external then
						Result := l_parent_type.dotnet_type.is_subclass_of (l_external_type)
					end
					parents.forth
				end
			end
		end

feature -- Element Settings

	set_partial (a_bool: BOOLEAN)
			-- Set `is_partial' to `a_bool'.
		do
			is_partial := a_bool
		ensure
			set: is_partial = a_bool
		end

	add_indexing_clause (a_clause: CODE_INDEXING_CLAUSE)
			-- Add `a_clause' to `indexing_clauses'.
		require
			attached_indexing_clause: a_clause /= Void
		do
			indexing_clauses.extend (a_clause)
		ensure
			a_clause_added: indexing_clauses.has (a_clause)
		end

	add_generic_parameter (a_parameter: CODE_GENERIC_PARAMETER)
			-- Add `a_parameter' to `generic_parameters'.
		require
			attached_parameter: a_parameter /= Void
		do
			generic_parameters.extend (a_parameter)
		ensure
			a_parameter_added: generic_parameters.has (a_parameter)
		end

	add_parent (a_parent: CODE_PARENT)
			-- Add `a_parent' to `parents'.
		require
			attached_parent: a_parent /= Void
		do
			parents.put (a_parent, a_parent.type.eiffel_name)
		ensure
			parent_added: parents.has (a_parent.type.eiffel_name)
		end

	add_feature (a_feature: CODE_FEATURE)
			-- Add `a_feature' to `features'.
		require
			attached_feature: a_feature /= Void
		local
			l_list: ARRAYED_LIST [CODE_FEATURE]
		do
			features.put (a_feature, a_feature.eiffel_name)
			dotnet_features.search (a_feature.name)
			if dotnet_features.found then
				dotnet_features.found_item.extend (a_feature)
			else
				create l_list.make (1)
				l_list.extend (a_feature)
				dotnet_features.put (l_list, a_feature.name)
			end
		ensure
			feature_added: features.has (a_feature.eiffel_name)
			dotnet_feature_added: dotnet_features.has (a_feature.name)
		end

	add_implementation_feature (a_feature: CODE_TRY_CATCH_IMPLEMENTATION_FEATURE)
			-- Add `a_feature' to `implementation_features'.
		require
			attached_feature: a_feature /= Void
		do
			implementation_features.put (a_feature, a_feature.name)
		ensure
			feature_added: features.has (a_feature.name)
		end

	add_creation_routine (a_creation_routine: CODE_CREATION_ROUTINE)
			-- Add `a_creation_routine' to `creation_routines'.
		require
			attached_creation_routine: a_creation_routine /= Void
		local
			l_indexing_clause: CODE_INDEXING_CLAUSE
		do
			creation_routines.put (a_creation_routine, a_creation_routine.eiffel_name)
			create l_indexing_clause.make
			l_indexing_clause.set_tag ("dotnet_constructors")
			l_indexing_clause.set_text (a_creation_routine.eiffel_name)
			add_indexing_clause (l_indexing_clause)
		ensure
			creation_routine_added: creation_routines.has (a_creation_routine.eiffel_name)
		end

	add_undefine_clause (a_parent: CODE_TYPE_REFERENCE; a_routine: CODE_MEMBER_REFERENCE)
			-- Add undefine clause for parent `a_dotnet_parent_name' and feature `a_feature_name'.
		require
			attached_parent: a_parent /= Void
			attached_routine: a_routine /= Void
		local
			l_parent: CODE_PARENT
		do
			l_parent := parent (a_parent.eiffel_name)
			if l_parent /= Void then
				l_parent.add_undefine_clause (create {CODE_UNDEFINE_CLAUSE}.make (a_routine, a_parent))
			else
				Event_manager.raise_event ({CODE_EVENTS_IDS}.Missing_parent, [a_parent.eiffel_name + "(" + a_parent.name + ")", eiffel_name + "(" + name + ")"])
			end
		end

	add_redefine_clause (a_parent: CODE_TYPE_REFERENCE; a_routine: CODE_MEMBER_REFERENCE)
			-- Add redefine clause for parent `a_parent' and feature `a_routine'.
		require
			attached_parent: a_parent /= Void
			attached_routine: a_routine /= Void
		local
			l_parent: CODE_PARENT
		do
			l_parent := parent (a_parent.eiffel_name)
			if l_parent /= Void then
				l_parent.add_redefine_clause (create {CODE_REDEFINE_CLAUSE}.make (a_routine, a_parent))
			else
				Event_manager.raise_event ({CODE_EVENTS_IDS}.Missing_parent, [a_parent.eiffel_name + "(" + a_parent.name + ")", eiffel_name + "(" + name + ")"])
			end
		end

	add_rename_clause (a_parent: CODE_TYPE_REFERENCE; a_routine: CODE_MEMBER_REFERENCE; a_new_name: STRING)
			-- Add rename clause for parent `a_parent' and feature `a_routine' renamed as `a_new_name'.
		require
			attached_parent: a_parent /= Void
			attached_routine: a_routine /= Void
			attached_new_name: a_new_name /= Void
		local
			l_parent: CODE_PARENT
		do
			l_parent := parent (a_parent.eiffel_name)
			if l_parent /= Void then
				l_parent.add_rename_clause (create {CODE_RENAME_CLAUSE}.make (a_routine, a_parent, a_new_name))
			else
				Event_manager.raise_event ({CODE_EVENTS_IDS}.Missing_parent, [a_parent.eiffel_name + "(" + a_parent.name + ")", eiffel_name + "(" + name + ")"])
			end
		end

	set_snippet_inherit_clause (a_text: STRING)
			-- Set `snippet_inherit_clause' with `a_text'.
		require
			attached_text: a_text /= Void
		do
			snippet_inherit_clause := a_text
		ensure
			snippet_inherit_clause_set: snippet_inherit_clause = a_text
		end

feature -- Code generation

	header: STRING
			-- | Call `indexing_clauses', `parents' and `creation_routines_declaration' if any.

			-- Eiffel code of type header (from indexing clause to creation routine declaration)
		require
			is_in_code_generation: current_state = Code_generation
		do
			create Result.make (5000)
				-- indexing
			if indexing_clauses /= Void and then indexing_clauses.count > 0 then
				Result.append (indexing_clause)
			end
				-- class
			Result.append (class_declaration)

				-- alias
			Result.append ("alias")
			Result.append (Line_return)
			Result.append ("%T%"")
			Result.append (name)
			Result.append ("%"")
			Result.append (Line_return)
			Result.append (Line_return)

				-- inherit
			if (parents /= Void and then parents.count > 0) or snippet_inherit_clause /= Void then
				Result.append (inheritance_clause)
				Result.append (Line_return)
			end
				-- create
			Result.append (creation_clause)
		ensure
			header_generated: Result /= Void and not Result.is_empty
		end

	indexing_clause: STRING
			-- | Loop on `indexing_clauses': call `indexing_clause' for each item.

			-- Indexing clauses code (include `indexing' keyword)
		require
			not_empty_indexing_clauses: indexing_clauses.count > 0
			is_in_code_generation: current_state = Code_generation
		local
			l_indexing_clause: CODE_INDEXING_CLAUSE
		do
			create Result.make (250)
			Result.append ("indexing")
			Result.append (Line_return)
			from
				indexing_clauses.start
			until
				indexing_clauses.after
			loop
				l_indexing_clause := indexing_clauses.item
				if l_indexing_clause /= Void then
					Result.append_character ('%T')
					Result.append (l_indexing_clause.code)
					Result.append (Line_return)
				end
				indexing_clauses.forth
			end
		ensure
			a_clause_generated: Result /= Void and Result.count > 0
		end

	class_declaration: STRING
			-- Class declaration (including class name and qualifiers like deferred, expanded or frozen)
		require
			is_in_code_generation: current_state = Code_generation
		do
			create Result.make (50)
			if is_partial then
				Result.append ("partial ")
			end
			Result.append ("class")
			Result.append (Line_return)
			Result.append ("%T")
			Result.append (eiffel_name)
			if not generic_parameters.is_empty then
				Result.append (" [")
				from
					generic_parameters.start
					Result.append (generic_parameters.item.code)
					if not generic_parameters.after then
						generic_parameters.forth
					end
				until
					generic_parameters.after
				loop
					Result.append (", ")
					Result.append (generic_parameters.item.code)
					generic_parameters.forth
				end
				Result.append ("]")
			end
			Result.append (Line_return)
		ensure
			attached_class_declaration: Result /= Void
			not_empty_class_declaration: Result.count > 0
		end

	inheritance_clause: STRING
			-- | loop on parents, then loop on feature_clause of parent

			-- Parents code (include `inherit' keyword, parent names and associated inheritance clauses)
		require
			not_empty_parents: parents.count > 0
			is_in_code_generation: current_state = Code_generation
		local
			l_snippet_parents: LIST [CODE_SNIPPET_PARENT]
			l_parent: CODE_PARENT
			l_snippet_parent: CODE_SNIPPET_PARENT
		do
			create Result.make (200)
			Result.append ("inherit")
			Result.append (Line_return)
			if snippet_inherit_clause /= Void then
				Inheritance_clause_parser.parse (snippet_inherit_clause)
				l_snippet_parents := Inheritance_clause_parser.parents
			end
			from
				parents.start
			until
				parents.after
			loop
				l_parent := parents.item_for_iteration
				if l_snippet_parents /= Void then
					from
						l_snippet_parents.start
					until
						l_snippet_parents.after
					loop
						l_snippet_parent := l_snippet_parents.item
						if l_snippet_parent.type.is_equal (l_parent.type.eiffel_name) then
							l_parent.set_snippet_parent (l_snippet_parent)
							l_snippet_parents.remove
							l_snippet_parents.finish
						end
						l_snippet_parents.forth
					end
				end
				Result.append (l_parent.code)
				parents.forth
			end

			-- Generate code for snippet parents that do not have a matching
			-- generated parent
			if l_snippet_parents /= Void then
				from
					l_snippet_parents.start
				until
					l_snippet_parents.after
				loop
					Result.append (l_snippet_parents.item.code)
					l_snippet_parents.forth
				end
			end
		ensure
			parents_generated: Result /= Void and not Result.is_empty
		end

	creation_clause: STRING
			-- Code of creation clause
		require
			is_in_code_generation: current_state = Code_generation
		do
			create Result.make (100)
			if creation_routines.count = 0 then
				Result.append ("create {NONE}")
				Result.append (Line_return)
				Result.append (Line_return)
			else
				Result.append ("create")
				Result.append (Line_return)
				Result.append (tabulation_string)
				from
					creation_routines.start
					if not creation_routines.after then
						Result.append (creation_routines.item_for_iteration.eiffel_name)
						creation_routines.forth
					end
				until
					creation_routines.after
				loop
					Result.append_character (',')
					Result.append (creation_routines.item_for_iteration.eiffel_name)
					Result.append (Line_return)
					Result.append (tabulation_string)
					creation_routines.forth
				end
				Result.append (Line_return)
				Result.append (Line_return)
			end
		end

	body: STRING
			-- Eiffel code of type body
		require
			is_in_code_generation: current_state = Code_generation
		do
			create Result.make (100)
			if creation_routines.count > 0 then
				Result.append (features_code (creation_routines))
			end
			if features.count > 0 then
				Result.append (features_code (features))
			end
			if implementation_features.count > 0 then
				Result.append (Line_return)
				Result.append ("feature {NONE} -- Try/Catch Implementation")
				Result.append (Line_return)
				from
					implementation_features.start
				until
					implementation_features.after
				loop
					Result.append (implementation_features.item_for_iteration.code)
					implementation_features.forth
				end
			end
		ensure
			body_generated: Result /= Void
		end

	features_code (a_features: HASH_TABLE [CODE_FEATURE, STRING]): STRING
			-- Code corresponding to features `a_features'
		require
			attached_features: a_features /= Void
			is_in_code_generation: current_state = Code_generation
		local
			l_clauses: HASH_TABLE [LIST [CODE_FEATURE], STRING]
			l_features: LIST [CODE_FEATURE]
		do
			create Result.make (1000)
			l_clauses := features_per_clauses (a_features)
			from
				l_clauses.start
			until
				l_clauses.after
			loop
				l_features := l_clauses.item_for_iteration
				Result.append (l_clauses.key_for_iteration)
				from
					l_features.start
					if not l_features.after then
						Result.append (l_features.item.code)
						l_features.forth
					end
				until
					l_features.after
				loop
					Result.append (l_features.item.code)
					l_features.forth
				end
				l_clauses.forth
			end
		end

	footer: STRING
			-- | Call `invariants'.

			-- Eiffel code of type footer (from `invariant' keyword to end of type)
		require
			is_in_code_generation: current_state = Code_generation
		do
			create Result.make (eiffel_name.count + 8)
			Result.append (Line_return)
			Result.append ("end -- ")
			Result.append (eiffel_name)
		ensure
			footer_generated: Result /= Void and then not Result.is_empty
		end

	features_per_clauses (a_features: HASH_TABLE [CODE_FEATURE, STRING]): HASH_TABLE [LIST [CODE_FEATURE], STRING]
			-- Features ordered per feature clause
		require
			attached_features: a_features /= Void
			is_in_code_generation: current_state = Code_generation
		local
			l_clause: STRING
		do
			create {HASH_TABLE [ARRAYED_LIST [CODE_FEATURE], STRING]} Result.make (a_features.count)
			from
				a_features.start
			until
				a_features.after
			loop
				l_clause := a_features.item_for_iteration.feature_clause
				if not Result.has (l_clause) then
					Result.extend (create {ARRAYED_LIST [CODE_FEATURE]}.make (4), l_clause)
				end
				check
					has_clause: Result.has (l_clause)
				end
				Result.item (l_clause).extend (a_features.item_for_iteration)
				a_features.forth
			end
		ensure
			attached_result: Result /= Void
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object considered
			-- equal to current object?
			-- We consider that CodeDom has the same limitation as C# where
			-- two namespaces with the same name cannot have types with the same name
		do
			Result := other.name.is_equal (name)
		end

invariant
	attached_indexing_clauses: indexing_clauses /= Void
	attached_generic_parameters: generic_parameters /= Void
	attached_parents: parents /= Void
	attached_creation_routines: creation_routines /= Void
	attached_features: features /= Void
	attached_dotnet_features: dotnet_features /= Void

note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software"
	license:	"GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options:	"http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful,	but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the	GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA
		]"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"
end -- class CODE_GENERATED_TYPE

