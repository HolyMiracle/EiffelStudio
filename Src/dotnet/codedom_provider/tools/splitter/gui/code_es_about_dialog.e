indexing
	description: "Objects that represent an EV_DIALOG.%
		%The original version of this class was generated by EiffelBuild."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	CODE_ES_ABOUT_DIALOG

inherit
	CODE_ES_ABOUT_DIALOG_IMP

feature {NONE} -- Initialization

	user_initialization is
			-- called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do
		end

feature {NONE} -- Implementation
	
	on_web_click (a_x, a_y, a_button: INTEGER; a_x_tilt, a_y_tilt, a_pressure: DOUBLE; a_screen_x, a_screen_y: INTEGER) is
			-- Called by `pointer_button_release_actions' of `web_address_label'.
			-- Open web browser on `http://www.eiffel.com'.
		local
			l_browser_path: STRING
			l_retried: BOOLEAN
			l_file: RAW_FILE
		do
			if not l_retried then
				l_browser_path := (create {EXECUTION_ENVIRONMENT}).get ("SystemDrive")
				if l_browser_path /= Void then
					l_browser_path.append ("\Program Files\Internet Explorer\iexplore.exe")
					create l_file.make (l_browser_path)
					if l_file.exists then
						(create {WEL_PROCESS_LAUNCHER}).spawn ("%"" + l_browser_path + "%" http://www.eiffel.com", Void)
					end
				end
			end
		rescue
			l_retried := True
			retry
		end

	on_mouse_enter is
			-- Called by `pointer_enter_actions' of `web_address_label'.
			-- Change mouse cursor to "hyperlink hovering mouse cursor"
		local
			l_font: EV_FONT
		do
			default_font := web_address_label.font
			l_font := default_font.twin
			l_font.set_weight ((create {EV_FONT_CONSTANTS}).Weight_bold)
			web_address_label.set_font (l_font)
		end

	on_mouse_leave is
			-- Called by `pointer_leave_actions' of `web_address_label'.
			-- Restore mouse cursor.
		do
			web_address_label.set_font (default_font)
		end

	default_font: EV_FONT
			-- Default web label font

	on_ok is
			-- Called by `select_actions' of `ok_button'.
			-- Close dialog
		do
			destroy
		end

indexing
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


end -- class CODE_ES_ABOUT_DIALOG

--+--------------------------------------------------------------------
--| eSplitter
--| Copyright (C) Eiffel Software
--| Eiffel Software Confidential
--| All rights reserved. Duplication and distribution prohibited.
--|
--| Eiffel Software
--| 356 Storke Road, Goleta, CA 93117 USA
--| http://www.eiffel.com
--+--------------------------------------------------------------------