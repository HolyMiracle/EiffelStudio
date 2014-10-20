note
	description: "Objects that represent an EV_TITLED_WINDOW.%
		%The original version of this class was generated by EiffelBuild."
	generator: "EiffelBuild"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	WDOCS_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			create_interface_objects, initialize, is_in_default_state
		end

	SHARED_EMBEDED_WEB_SERVICE_INFORMATION
		undefine
			default_create, copy
		end

create
	make

feature {NONE} -- Initialization

	make
			-- Creation method
		do
			default_create
		end

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_TITLED_WINDOW}

			set_title ("Wiki Docs App")

				-- Connect events.
				-- Close the application when an interface close
				-- request is received on `Current'. i.e. the cross is clicked.
			close_request_actions.extend (agent destroy_and_exit_if_last)

				-- Call `user_initialization'.
			user_initialization
		end

	create_interface_objects
			-- Create objects
		do
			create wdocs_browser.make (port_number)
			create wdocs_control.make (port_number)

		end

	user_initialization
			-- Called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		local
			vb: EV_VERTICAL_BOX
			sp: EV_HORIZONTAL_SPLIT_AREA
		do
			set_size (800, 600)

			create vb
			extend (vb)
			vb.set_border_width (3)
			vb.set_padding_width (3)

			create sp
			vb.extend (sp)
			sp.set_first (wdocs_control)
			sp.set_second (wdocs_browser)
			sp.resize_actions.extend_kamikaze (agent (ix,iy,iw,ih: INTEGER; isp: EV_SPLIT_AREA) do isp.set_split_position (180) end(?,?,?,?,sp))

			wdocs_control.wiki_page_select_actions.extend (agent open_wiki_page)
		end

	is_in_default_state: BOOLEAN
		do
			Result := True
		end

feature -- Basic operation

	open_wiki_page (wp: WIKI_PAGE)
		do
			wdocs_browser.open ("http://localhost:" + port_number.out + "/book/" + wp.parent_key + "/" + wp.key)
		end

	open_link
		do
			wdocs_browser.set_port_number (port_number)
			wdocs_browser.open ("http://localhost:" + port_number.out)
		end

feature {NONE} -- Implementation

	wdocs_browser: WDOCS_BROWSER
	wdocs_control: WDOCS_CONTROL

;note
	copyright:	"Copyright (c) 1984-2009, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"


end
