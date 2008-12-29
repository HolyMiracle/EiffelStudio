note

	description:
			"A MEL_ROW_COLUMN used as a menu bar."
	legal: "See notice at end of class.";
	status: "See notice at end of class.";
	date: "$Date$";
	revision: "$Revision$"

class
	MEL_MENU_BAR

inherit

	MEL_ROW_COLUMN
		export
			{NONE} menu_history, mnemonic, mnemonic_char_set, is_popup_enabled,
			is_radio_behavior, is_working_area, is_menu_bar, is_menu_popup,
			is_menu_option, is_menu_pulldown, is_tear_off_enabled,
			set_menu_history, set_mnemonic, set_mnemonic_char_set,
			enable_popup, disable_popup, enable_radio_behavior, disable_radio_behavior
		redefine
			make
		end

create 
	make,
	make_from_existing

feature -- Initialization

	make (a_name: STRING; a_parent: MEL_COMPOSITE; do_manage: BOOLEAN)
			-- Create a motif menu bar.
		local
			widget_name: ANY
		do
			parent := a_parent;
			widget_name := a_name.to_c;
			screen_object := xm_create_menu_bar (a_parent.screen_object, $widget_name, default_pointer, 0);
			Mel_widgets.add (Current);
			set_default;
			if do_manage then
				manage
			end
		end;

feature {NONE} -- Implementation

	xm_create_menu_bar (a_parent, a_name, arglist: POINTER; argcount: INTEGER): POINTER
		external
			"C (Widget, String, ArgList, Cardinal): EIF_POINTER | <Xm/RowColumn.h>"
		alias
			"XmCreateMenuBar"
		end;

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




end -- class MEL_MENU_BAR


