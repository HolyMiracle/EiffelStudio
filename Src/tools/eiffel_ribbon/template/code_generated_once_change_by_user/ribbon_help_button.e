﻿note
	description: "[
					Generated by EiffelRibbon tool
					Don't edit this file, since it will be replaced by EiffelRibbon tool
					generated files everytime
						]"
	date: "$Date$"
	revision: "$Revision$"

class
	$INDEX

inherit
	EV_RIBBON_HELP_BUTTON
		redefine
			create_interface_objects
		end
		
create
	make_with_command_list

feature {NONE} -- Initialization

	create_interface_objects
			-- Create objects
		do
			create select_actions
		end
		
feature {NONE} -- Implementation

end
