note
	description: "[
		Selection table:

		Associates routine ids with execution units. At generation time
		the select table leads to one descriptor per associated class type.
		]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class SELECT_TABLE

inherit
	SHARED_WORKBENCH
		undefine
			is_equal, copy
		end

	COMPILER_EXPORTER
		undefine
			is_equal, copy
		end

	SHARED_HISTORY_CONTROL
		undefine
			is_equal, copy
		end

	HASH_TABLE [INTEGER, INTEGER]
		rename
			make as internal_table_make,
			item as internal_table_item,
			item_for_iteration as internal_table_item_for_iteration,
			found_item as internal_table_found_item,
			put as internal_table_put
		end

create
	make

create {SELECT_TABLE}
	internal_table_make

feature {NONE} -- Initialization

	make (n: INTEGER; a_feat_tbl: FEATURE_TABLE)
			--
		require
			a_feat_tbl_not_void: a_feat_tbl /= Void
		do
			internal_table_make (n)
			feature_table := a_feat_tbl
		ensure
			feature_table_set: feature_table = a_feat_tbl
		end

feature -- Access

	feature_table: FEATURE_TABLE
			-- Feature table associated to Current.

feature -- HASH_TABLE like feature

	item (an_id: INTEGER): FEATURE_I
			-- Item of name ID `an_id'
		require
			an_id_positive: an_id > 0
		local
			l_id: INTEGER
		do
			l_id := internal_table_item (an_id)
			if l_id > 0 then
				Result := feature_table.item_id (l_id)
			end
		end

	item_for_iteration: FEATURE_I
		local
			l_id: INTEGER
		do
			l_id := internal_table_item_for_iteration
			check l_id > 0 end
			Result := feature_table.item_id (l_id)
		end

	found_item: FEATURE_I
			--
		local
			l_id: INTEGER
		do
			l_id := internal_table_found_item
			check l_id > 0 end
			Result := feature_table.item_id (l_id)
		end

feature -- Element change

	add_feature (a_feat: FEATURE_I)
			-- Add `a_feat' in Current
		require
			a_feat_not_void: a_feat /= Void
		local
			i, nb, l_name_id: INTEGER
			l_id_set: ROUT_ID_SET
		do
			l_id_set := a_feat.rout_id_set
			nb := l_id_set.count
			l_name_id := a_feat.feature_name_id
			internal_table_put (l_name_id, l_id_set.first)
			if nb > 1 then
				from
					i := 2
				until
					i > nb
				loop
					internal_table_put (l_name_id, l_id_set.item (i))
					i := i + 1
				end
			end
		end

	remove_feature (a_feat: FEATURE_I)
			-- Add `a_feat' in Current
		require
			a_feat_not_void: a_feat /= Void
		local
			i, nb: INTEGER
			l_id_set: ROUT_ID_SET
		do
			l_id_set := a_feat.rout_id_set
			nb := l_id_set.count
			remove (l_id_set.first)
			if nb > 1 then
				from
					i := 2
				until
					i > nb
				loop
					remove (l_id_set.item (i))
					i := i + 1
				end
			end
		end

feature -- Final mode

	add_units (a_class: CLASS_C)
			-- Insert units of Current in the history
			-- controler (routine table construction)
		local
			l_table: like feature_table
			l_features: HASH_TABLE [TYPE_FEATURE_I, INTEGER_32]
		do
			from
				l_table := feature_table
				l_table.start
			until
				l_table.after
			loop
				add_feature_unit (a_class.class_id, l_table.item_for_iteration)
				l_table.forth
			end

			l_features := a_class.generic_features
			if l_features /= Void then
				from
					l_features.start
				until
					l_features.after
				loop
					add_feature_unit (a_class.class_id, l_features.item_for_iteration)
					l_features.forth
				end
			end

			if
				attached a_class.object_relative_once_infos as l_obj_once_infos and then
				attached l_obj_once_infos.new_cursor as l_once_infos_cursor
			then
				from
					l_once_infos_cursor.start
				until
					l_once_infos_cursor.after
				loop
					if attached l_once_infos_cursor.item as l_once_info then
						add_feature_unit (a_class.class_id, l_once_info.called_attribute_i)
						add_feature_unit (a_class.class_id, l_once_info.exception_attribute_i)
						if l_once_info.has_result then
							add_feature_unit (a_class.class_id, l_once_info.result_attribute_i)
						end
					end
					l_once_infos_cursor.forth
				end
			end
		end

feature -- Incrementality

	equiv (other: like Current; c: CLASS_C): BOOLEAN
			-- Incrementality test on the select table in second pass.
		require
			good_argument: other /= Void
		local
			f2: FEATURE_I
			is_freeze_requested: BOOLEAN
		do
			is_freeze_requested := system.is_freeze_requested
				-- At least the counts should be the same.
			from
				start
				Result := other.count = count
			until
				after or else (not Result and then is_freeze_requested)
			loop
				f2 := other.item (key_for_iteration)
				if f2 = Void then
					Result := False
					if not is_freeze_requested and then c.visible_level.is_visible (item_for_iteration, c.class_id) then
							-- Remove references to the old feature in CECIL data.
						system.request_freeze
						is_freeze_requested := True
					end
				else
					check
						item_for_iteration.feature_name_32.is_equal (f2.feature_name_32)
					end
					if not item_for_iteration.select_table_equiv (f2) then
						Result := False
						if not is_freeze_requested and then c.visible_level.is_visible (f2, c.class_id) then
								-- Regenerate C code for visible feature so that it can be accessed via CECIL.
							system.request_freeze
							is_freeze_requested := True
						end
					end
				end
				forth
			end
		end

feature {NONE} -- Implementation

	is_consistent: BOOLEAN
			-- Is Current consistent?
		local
			l_cursor: CURSOR
		do
			l_cursor := cursor
			from
				Result := True
				start
			until
				after or not Result
			loop
				Result := item_for_iteration.rout_id_set.has (key_for_iteration)
				forth
			end
			go_to (l_cursor)
		end

	add_feature_unit (id: INTEGER; a_feature: FEATURE_I)
			-- Insert units of Current in the history
			-- controler (routine table construction)
		require
			a_feature_not_void: a_feature /= Void
		local
			l_id_set: ROUT_ID_SET
			i, nb: INTEGER
			l_control: like history_control
		do
			l_control := history_control
			l_id_set := a_feature.rout_id_set
			l_control.add_new (a_feature, id, l_id_set.first)
			nb := l_id_set.count
			if nb > 1 then
				from
					i := 2
				until
					i > nb
				loop
					l_control.add_new (a_feature, id, l_id_set.item (i))
					i := i + 1
				end
			end
		end

invariant
	feature_table_not_void: feature_table /= Void
		-- Test below is because while in the creation procedure of FEATURE_TABLE
		-- the creation of the SELECT_TABLE is not completed yet, so we have to protect
		-- ourself here.
	related_feature_table: feature_table.select_table /= Void implies
		feature_table.select_table = Current
	is_consistent: is_consistent

note
	copyright:	"Copyright (c) 1984-2014, Eiffel Software"
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
			distributed in the hope that it will be useful, but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
		]"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end -- class SELECT_TABLE
