indexing
	description: "[
		List that collects all generic derivation of a generic class
		in current system.
		]"
	date: "$Date$"
	revision: "$Revision$"
	
class TYPE_LIST

inherit
	ARRAYED_LIST [CLASS_TYPE]
		export
			{ANY} first, start, after, forth, item, is_empty, count,
				remove, cursor, go_to, wipe_out, extend, valid_index,
				valid_cursor, extendible, prunable, readable, index, off,
				writable
			{TYPE_LIST} all
		end

create
	make
	
create {TYPE_LIST}
	make_filled

feature -- Search

	has_type (t: TYPE_I): BOOLEAN is
			-- Is the type `t' present in instances of CLASS_TYPE in the
			-- list ?
		require
			type_not_void: t /= Void
		local
			l_area: like area
			l_item: like item
			i, nb: INTEGER
		do
			from
				l_area := area
				nb := count - 1
			until
				i > nb or Result
			loop
				l_item := l_area.item (i)
				Result := l_item.type.same_as (t)
				i := i + 1
			end

			if Result then
				found_item := l_item
			else
				found_item := Void
			end
		ensure
			cursor_not_changed: index = old index
		end

	search_item (t: TYPE_I): CLASS_TYPE is
			-- Is the type `t' present in instances of CLASS_TYPE in the list?
			-- If not, return the last item found in the list.
		require
			type_not_void: t /= Void
			has_type: has_type (t)
		do
			if has_type (t) then
				Result := found_item
			end
		ensure
			cursor_not_changed: index = old index
			result_not_void: Result /= Void
		end

feature -- Access

	found_item: CLASS_TYPE
			-- Last item found during a search.

	nb_modifiable_types: INTEGER is
			-- Number of modifiable types (i.e. precompiled or static)
			-- derived from the current class
		local
			l_area: like area
			i, nb: INTEGER
		do
			from
				l_area := area
				nb := count - 1
			until
				i > nb
			loop
				if l_area.item (i).is_modifiable then
					Result := Result + 1
				end
				i := i + 1
			end
		ensure
			cursor_not_changed: index = old index
		end

feature -- Traversals

	pass4 is
			-- Proceed to the `pass4' on the items of the list.
		local
			l_area: like area
			i, nb: INTEGER
		do
			from
				l_area := area
				nb := count - 1
			until
				i > nb
			loop
				l_area.item (i).pass4
				i := i + 1
			end
		ensure
			cursor_not_changed: index = old index
		end

	melt is
			-- Proceed to the `melt' on the items of the list
		local
			l_area: like area
			l_item: like item
			i, nb: INTEGER
		do
			from
				l_area := area
				nb := count - 1
			until
				i > nb
			loop
				l_item := l_area.item (i)
				if not l_item.is_precompiled then
					l_item.melt
				end
				i := i + 1
			end
		ensure
			cursor_not_changed: index = old index
		end

	update_execution_table is
			-- Proceed to the `update_execution_table' on the items of the list
		local
			l_area: like area
			l_item: like item
			i, nb: INTEGER
		do
			from
				l_area := area
				nb := count - 1
			until
				i > nb
			loop
				l_item := l_area.item (i)
				if not l_item.is_precompiled then
					l_item.update_execution_table
				end
				i := i + 1
			end
		ensure
			cursor_not_changed: index = old index
		end

	melt_feature_table is
			-- Proceed to the `melt_feature_table' on the items of the list
		local
			l_area: like area
			l_item: like item
			i, nb: INTEGER
		do
			from
				l_area := area
				nb := count - 1
			until
				i > nb
			loop
				l_item := l_area.item (i)
				if l_item.is_modifiable then
					l_item.melt_feature_table
				end
				i := i + 1
			end
		ensure
			cursor_not_changed: index = old index
		end

end
