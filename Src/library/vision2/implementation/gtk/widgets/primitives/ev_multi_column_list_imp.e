--| FIXME Not for release
--| FIXME NOT_REVIEWED this file has not been reviewed
indexing
	description: 
		"EiffelVision multi-column-list, implementation interface."
	status: "See notice at end of class"
	id: "$$"
	date: "$Date$"
	revision: "$Revision$"

class
	EV_MULTI_COLUMN_LIST_IMP

inherit
	EV_MULTI_COLUMN_LIST_I
		redefine
			interface
		end

	EV_PRIMITIVE_IMP
		redefine
			interface,
			destroy,
			set_foreground_color,
			set_background_color,
			foreground_color,
			background_color
		end

	EV_ITEM_LIST_IMP [EV_MULTI_COLUMN_LIST_ROW]
		redefine
			item,
			count,
			remove_item_from_position,
			reorder_child,
			add_to_container,
			destroy,
			interface
		end

create
	make

feature {NONE} -- Initialization

	make (an_interface: like interface) is         
			-- Create a list widget with `par' as
			-- parent and `col_nb' columns.
			-- By default, a list allow only one selection.
		do
			base_make (an_interface)

			-- Creating the gtk scrolled window

			set_c_object (C.gtk_scrolled_window_new (Default_pointer, Default_pointer))
			C.gtk_scrolled_window_set_policy (
				c_object, C.GTK_POLICY_AUTOMATIC_ENUM, C.GTK_POLICY_AUTOMATIC_ENUM
			)
			create ev_children.make (0)
		end

	create_list (a_columns: INTEGER) is
			-- Create the clist with `a_columns' columns.
		local
			i: INTEGER
		do
			list_widget := C.gtk_clist_new (a_columns)

			if rows_height > 0 then
				C.gtk_clist_set_row_height (list_widget, rows_height)
			end
			C.gtk_widget_show (list_widget)
			C.gtk_container_add (c_object, list_widget)

			-- We need to specify a width for the columns
			-- otherwise the value given by gtk would be wrong.
			from
				i := 0
			until
				i = a_columns
			loop
				C.gtk_clist_set_column_width (list_widget, i, 80)
				i := i + 1
			end
			show_title_row
		end	

feature -- Access

	columns: INTEGER is
			-- Number of columns in the list.
		do
			if list_widget /= Default_pointer then
				Result := C.c_gtk_clist_columns (list_widget)
			end
		end

	rows, count: INTEGER is
			-- Number of rows in the list.
		do
			if list_widget /= Default_pointer then
				Result := C.c_gtk_clist_rows (list_widget)
			end
		end

	item: EV_MULTI_COLUMN_LIST_ROW is
		do
			Result ?= (ev_children @ (index)).interface
		end

	selected_item: EV_MULTI_COLUMN_LIST_ROW is
			-- Item which is currently selected, for a multiple
			-- selection.
		local
			an_index: INTEGER
		do
			if (list_widget /= Default_pointer and
				C.c_gtk_clist_selection_length (list_widget) = 0 ) then
					-- there is no selected item
				Result := Void
			elseif list_widget /= Default_pointer then
					-- there is one selected item
				an_index := C.c_gtk_clist_ith_selected_item (list_widget, 0)
				Result ?= (ev_children @ (an_index + 1)).interface
			end
		end

	selected_items: LINKED_LIST [EV_MULTI_COLUMN_LIST_ROW] is
			-- List of all the selected items. For a single
			-- selection list, it gives a list with only one
			-- element which is `selected_item'. Therefore, one
			-- should use `selected_item' rather than 
			-- `selected_items' for a single selection list
		local
			i: INTEGER
			an_index: INTEGER
			upper: INTEGER
			row: EV_MULTI_COLUMN_LIST_ROW
		do
			if list_widget /= Default_pointer then
				upper := C.c_gtk_clist_selection_length (list_widget)
			end
			create Result.make
			from
				i := 0
			until
				i = upper
			loop
				index := C.c_gtk_clist_ith_selected_item (list_widget, i)
				row ?= (ev_children @ (an_index + 1)).interface
				Result.extend (row)
				i := i + 1
			end
		end

	background_color: EV_COLOR is
			-- Color used for the background of the widget.
			-- This feature might change if we give the
			-- possibility to set colors on the rows.
		local
			one_row: EV_MULTI_COLUMN_LIST_ROW_IMP
		do
			if (rows > 0) then
				one_row := (ev_children @ (1))
				Result := one_row.background_color
			else	
				Result := {EV_PRIMITIVE_IMP} Precursor
			end
		end

	foreground_color: EV_COLOR is
			-- Color used for the foreground of the widget,
			-- usually the text.
			-- This feature might change if we give the
			-- possibility to set colors on the rows.
		local
			one_row: EV_MULTI_COLUMN_LIST_ROW_IMP
		do
			if (rows > 0) then
				one_row := (ev_children @ (1))
				Result := one_row.foreground_color
			else	
				Result := {EV_PRIMITIVE_IMP} Precursor
			end
		end

feature -- Status report

	selected: BOOLEAN is
			-- Is at least one item selected ?
		do
			if list_widget /= Default_pointer then
				Result := C.c_gtk_clist_selected (list_widget).to_boolean
			end
		end

	is_multiple_selection: BOOLEAN is
			-- True if the user can choose several items
			-- False otherwise
		do
			if list_widget /= Default_pointer then
				Result := (C.c_gtk_clist_selection_mode (list_widget) = C.GTK_SELECTION_MULTIPLE_ENUM)
			end
		end

	title_shown: BOOLEAN is
			-- True if the title row is shown.
			-- False if the title row is not shown.
		do
			if list_widget /= Default_pointer then
				Result := C.c_gtk_clist_title_shown (list_widget).to_boolean
			end
		end

	get_column_width (a_column: INTEGER): INTEGER is
			-- Width of column `column' in pixel.
		do
			Result := C.c_gtk_clist_column_width (list_widget, a_column - 1)
		end

feature -- Status setting

	destroy is
		-- Destroy screen widget implementation and EV_LIST_ITEM objects
		do
			clear_items
			{EV_PRIMITIVE_IMP} Precursor 
		end

	show_title_row is
			-- Show the row of the titles.
		do
			C.gtk_clist_column_titles_show (list_widget)
		end

	hide_title_row is
			-- Hide the row of the titles.
		do
			C.gtk_clist_column_titles_hide (list_widget)
		end

	set_multiple_selection is
			-- Allow the user to do a multiple selection simply
			-- by clicking on several choices.
			-- For constants, see EV_GTK_CONSTANTS
		do
			C.gtk_clist_set_selection_mode (list_widget, C.GTK_SELECTION_MULTIPLE_ENUM)
		end

	set_single_selection is
			-- Allow the user to do only one selection. It is the
			-- default status of the list.
			-- For constants, see EV_GTK_CONSTANTS
		do
			C.gtk_clist_set_selection_mode (list_widget, C.GTK_SELECTION_SINGLE_ENUM)
		end

	set_column_alignment (type: INTEGER; column: INTEGER) is
			-- Align the text of the column at left.

		do
			C.gtk_clist_set_column_justification (list_widget, column - 1, type)
		end

	select_item (an_index: INTEGER) is
			-- Select an item at the one-based `index' of the list.
		do
			(ev_children @ an_index).set_selected (True)
		end

	deselect_item (an_index: INTEGER) is
			-- Unselect the item at the one-based `index'.
		do
			(ev_children @ an_index).set_selected (False)
		end

	clear_selection is
			-- Clear the selection of the list.
		do
			C.gtk_clist_unselect_all (list_widget)
		end

feature -- Element change

	set_column_title (txt: STRING; column: INTEGER) is
			-- Make `txt' the title of the column number
			-- `number'.
		local
			a: ANY
		do
			a := txt.to_c
			C.gtk_clist_set_column_title (list_widget, column - 1, $a)
		end

	set_column_width (value: INTEGER; column: INTEGER) is
			-- Make `value' the new width of the column number
			-- `column'.
		do
			C.gtk_clist_set_column_width (list_widget, column - 1, value)
		end

	set_rows_height (value: INTEGER) is
			-- Make`value' the new height of all the rows.
		do
			if list_widget /= Default_pointer then
				C.gtk_clist_set_row_height (list_widget, value)
			else
				rows_height := value
			end
		end

	clear_items is
			-- Clear all the items of the list.
			-- (Remove them from the list and destroy them).
		local
			--c: ARRAYED_LIST [EV_MULTI_COLUMN_LIST_ROW_IMP]
				-- to work with local variable which
				-- increases speed if there are many elements
				-- in `ev_children'
		do
			if rows > 0 then
				ev_children.wipe_out	
				C.gtk_clist_clear (list_widget)
			end
		end

	set_background_color (a_color: EV_COLOR) is
			-- Make `a_color' the new `background_color' of every rows.
		local
			children_array: ARRAYED_LIST [EV_MULTI_COLUMN_LIST_ROW_IMP]
			row: EV_MULTI_COLUMN_LIST_ROW_IMP
		do
			if (rows > 0) then
				from
					children_array := ev_children
					children_array.start
				until
					children_array.after
				loop
					row := children_array.item
					row.set_background_color (a_color)
					children_array.forth
				end
			else
				 {EV_PRIMITIVE_IMP} Precursor (a_color)
			end
		end

	set_foreground_color (a_color: EV_COLOR) is
			-- Make `a_color' the new `foreground_color' of every rows.
		local
			children_array: ARRAYED_LIST [EV_MULTI_COLUMN_LIST_ROW_IMP]
			row: EV_MULTI_COLUMN_LIST_ROW_IMP
		do
			if (rows > 0) then
				from
					children_array := ev_children
					children_array.start
				until
					children_array.after
				loop
					row := children_array.item
					row.set_foreground_color (a_color)
					children_array.forth
				end
			else
				{EV_PRIMITIVE_IMP} Precursor (a_color)
			end
		end

feature -- Event : command association

	add_select_command (cmd: EV_COMMAND; arg: EV_ARGUMENT) is	
			-- Add `cmd' to the list of commands to be executed
			-- when a row has been selected.
		local
			i: INTEGER
		do
			-- We pass 0 as the extra_data to have a different handling in 'c_gtk_signal_connect_general'.
			i := 0
			--add_command (list_widget, "select_row", cmd, arg, C.c_gtk_integer_to_pointer (i))
		end

	add_unselect_command (cmd: EV_COMMAND; arg: EV_ARGUMENT) is	
			-- Add `cmd' to the list of commands to be executed
			-- when a row has been unselected.
		local
			i: INTEGER
		do
			-- We pass 0 as the extra_data to have a different handling in 'c_gtk_signal_connect_general'.
			i := 0
			--add_command (list_widget, "unselect_row", cmd, arg, c_gtk_integer_to_pointer (i))
		end

	add_column_click_command (cmd: EV_COMMAND; arg: EV_ARGUMENT) is
			-- Add `cmd' to the list of commands to be executed
			-- when a column is clicked.
		do
			--add_command (list_widget, "click_column", cmd, arg, default_pointer)
		end

feature -- Event -- removing command association

	remove_select_commands is	
			-- Empty the list of commands to be executed
			-- when an item has been selected.
		local
			list: LINKED_LIST [EV_COMMAND]
		do
			-- list of the commands to be executed for "select_row" signal.
			--list := (event_command_array @ select_row_id).command_list

			from
				list.start
			until
				list.after
			loop
			--	remove_single_command (list_widget, select_row_id, list.item)
				-- we do not need to do "list.forth" as an item has been removed
				-- that list.
			end
		end

	remove_unselect_commands is	
			-- Empty the list of commands to be executed
			-- when an item has been unselected.
		local
			list: LINKED_LIST [EV_COMMAND]
		do
			-- list of the commands to be executed for "unselect_row" signal.
			--list := (event_command_array @ unselect_row_id).command_list

			from
				list.start
			until
				list.after
			loop
			--	remove_single_command (list_widget, unselect_row_id, list.item)
				-- we do not need to do "list.forth" as an item has been removed
				-- that list.
			end
		end

	remove_column_click_commands is
			-- Empty the list of commands to be executed
			-- when a column is clicked.
		do
			--remove_commands (list_widget, click_column_id)
		end

feature {NONE} -- Implementation

	add_to_container (v: EV_MULTI_COLUMN_LIST_ROW) is
			-- Add `v' to the list.
		local
			an_index: INTEGER
			column_i: INTEGER
			item_imp: EV_MULTI_COLUMN_LIST_ROW_IMP
		do
			if list_widget = Default_pointer then
				create_list (v.columns)
			end

			item_imp ?= v.implementation
			item_imp.set_columns (columns)
			item_imp.set_parent_imp (Current)

			-- update the list of rows of the column list:
			ev_children.force (item_imp)

			-- add an empty row to the gtk column list:
			an_index := C.c_gtk_clist_append_row (list_widget)

			-- add text in the gtk column list row:
			from
				item_imp.internal_text.start
				column_i := 1
			until
				column_i > columns
			loop
				item_imp.set_cell_text ( column_i, item_imp.internal_text.item)
				item_imp.internal_text.forth
				column_i := column_i + 1
			end
		end

	remove_item_from_position (a_position: INTEGER) is
			-- Remove item from list at `a_position'.
			-- Set the items parent to void.
		local
			item_imp: EV_MULTI_COLUMN_LIST_ROW_IMP
		do
			item_imp ?= interface.i_th (a_position).implementation
			item_imp.set_parent_imp (Void)
			C.gtk_clist_remove (list_widget, a_position - 1)
			-- remove the row from the `ev_children'
			ev_children.move (a_position)
			ev_children.remove
		end

	reorder_child (v: like item; a_position: INTEGER) is
			-- Move `v' to `a_position' in Current.
		local
			item_imp: EV_MULTI_COLUMN_LIST_ROW_IMP
		do
			item_imp ?= v.implementation
			C.gtk_clist_row_move (list_widget, item_imp.index - 1, a_position - 1)
		end

	gtk_reorder_child (a_container, a_child: POINTER; a_position: INTEGER) is
			-- Move `a_child' to `a_position' in `a_container'.
		do
			check
				do_not_call: False
			end
		end

	rows_height: INTEGER
		-- Value used to store row height if list isn't yet created.

feature {EV_ANY_I} -- Implementation

	interface: EV_MULTI_COLUMN_LIST



feature {EV_MULTI_COLUMN_LIST_ROW_IMP} -- Implementation

	list_widget: POINTER

end -- class EV_MULTI_COLUMN_LIST_IMP

--!----------------------------------------------------------------
--! EiffelVision2: library of reusable components for ISE Eiffel.
--! Copyright (C) 1986-1999 Interactive Software Engineering Inc.
--! All rights reserved. Duplication and distribution prohibited.
--! May be used only with ISE Eiffel, under terms of user license. 
--! Contact ISE for any other use.
--!
--! Interactive Software Engineering Inc.
--! ISE Building, 2nd floor
--! 270 Storke Road, Goleta, CA 93117 USA
--! Telephone 805-685-1006, Fax 805-685-6869
--! Electronic mail <info@eiffel.com>
--! Customer support e-mail <support@eiffel.com>
--! For latest info see award-winning pages: http://www.eiffel.com
--!---------------------------------------------------------------

--|-----------------------------------------------------------------------------
--| CVS log
--|-----------------------------------------------------------------------------
--|
--| $Log$
--| Revision 1.24  2000/02/17 21:52:21  king
--| Implemented to use no column setting on creation
--|
--| Revision 1.23  2000/02/16 20:25:58  king
--| Implemented to fit in with new structure
--|
--| Revision 1.22  2000/02/15 19:24:35  king
--| Made compilable
--|
--| Revision 1.21  2000/02/14 11:40:32  oconnor
--| merged changes from prerelease_20000214
--|
--| Revision 1.20.6.3  2000/02/02 23:44:26  king
--| Corrected inheritence from ev_item_list
--|
--| Revision 1.20.6.2  2000/01/27 19:29:47  oconnor
--| added --| FIXME Not for release
--|
--| Revision 1.20.6.1  1999/11/24 17:29:57  oconnor
--| merged with DEVEL branch
--|
--| Revision 1.20.2.3  1999/11/17 01:53:05  oconnor
--| removed "child packing" hacks and obsolete _ref _unref wrappers
--|
--| Revision 1.20.2.2  1999/11/02 17:20:04  oconnor
--| Added CVS log, redoing creation sequence
--|
--|
--|-----------------------------------------------------------------------------
--| End of CVS log
--|-----------------------------------------------------------------------------
