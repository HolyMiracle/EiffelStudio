indexing
	description	: "Main window for this application"
	author		: "Generated by the New Vision2 Application Wizard."
	date		: "<FL_DATE>"
	revision	: "1.0.0"

class
	MAIN_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			initialize,
			is_in_default_state
		end

	INTERFACE_NAMES
		export
			{NONE} all
		undefine
			default_create, copy
		end

create
	default_create

feature {NONE} -- Initialization

	initialize is
			-- Build the interface for this window.
		do
			Precursor {EV_TITLED_WINDOW}
<FL_MENUBAR_ADD><FL_TOOLBAR_ADD><FL_STATUSBAR_ADD>
			build_main_container
			extend (main_container)

				-- Execute `request_close_window' when the user clicks
				-- on the cross in the title bar.
			close_request_actions.extend (agent request_close_window)

				-- Set the title of the window
			set_title (Window_title)

				-- Set the initial size of the window
			set_size (Window_width, Window_height)
		end

	is_in_default_state: BOOLEAN is
			-- Is the window in its default state
			-- (as stated in `initialize')
		do
			Result := (width = Window_width) and then
				(height = Window_height) and then
				(title.is_equal (Window_title))
		end

<FL_MENUBAR_INIT><FL_TOOLBAR_INIT><FL_STATUSBAR_INIT><FL_ABOUTDIALOG_INIT>
feature {NONE} -- Implementation, Close event

	request_close_window is
			-- The user wants to close the window
		local
			question_dialog: EV_CONFIRMATION_DIALOG
		do
			create question_dialog.make_with_text (Label_confirm_close_window)
			question_dialog.show_modal_to_window (Current)

			if question_dialog.selected_button.is_equal (question_dialog.ev_ok) then
					-- Destroy the window
				destroy;
				
					-- End the application
					--| TODO: Remove this line if you don't want the application
					--|       to end when the first window is closed..
				(create {EV_ENVIRONMENT}).application.destroy
			end
		end

feature {NONE} -- Implementation

	main_container: EV_VERTICAL_BOX
			-- Main container (contains all widgets displayed in this window)

	build_main_container is
			-- Create and populate `main_container'.
		require
			main_container_not_yet_created: main_container = Void
		do
			create main_container
	
			main_container.extend (create {EV_TEXT})
		ensure
			main_container_created: main_container /= Void
		end

feature {NONE} -- Implementation / Constants

	Window_title: STRING is "<FL_PROJECT_NAME>"
			-- Title of the window.

	Window_width: INTEGER is 400
			-- Initial width for this window.

	Window_height: INTEGER is 400
			-- Initial height for this window.

end -- class MAIN_WINDOW
