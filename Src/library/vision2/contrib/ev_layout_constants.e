indexing
	description	: "Constants for layout using Vision2"
	author		: "Arnaud PICHERY [ aranud@mail.dotcom.fr ]"
	date		: "$Date$"
	revision	: "$Revision$"

class
	EV_LAYOUT_CONSTANTS

feature -- Access (button size constants)

	Default_button_width: INTEGER is
			-- Default width for buttons
		once
			Result := layout_implementation.Default_button_width
		end

	Default_button_height: INTEGER is
			-- Default height for buttons
		once
			Result := layout_implementation.Default_button_height
		end

feature -- Access (padding constants)

	Large_border_size: INTEGER is
			-- Default size for borders
		once
			Result := layout_implementation.Large_border_size
		end

	Default_padding_size: INTEGER is
			-- Default size for padding
		once
			Result := layout_implementation.Default_padding_size
		end

	Small_padding_size: INTEGER is
			-- Small size for padding
		once
			Result := layout_implementation.Small_padding_size
		end

	Tiny_padding_size: INTEGER is
			-- Tiny size for padding
		once
			Result := layout_implementation.Tiny_padding_size
		end

feature -- Access (border constants)

	Default_border_size: INTEGER is
			-- Default size for borders
		once
			Result := layout_implementation.Default_border_size
		end

	Small_border_size: INTEGER is
			-- Small size for borders
		once
			Result := layout_implementation.Small_border_size
		end

feature -- Operation

	set_default_size_for_button (a_button: EV_BUTTON) is
			-- Set the default size for `a_button'.
		do
			layout_implementation.set_default_size_for_button (a_button)
		end

feature -- Conversion

	dialog_unit_to_pixels (a_size: INTEGER): INTEGER is
			-- Convert `a_size' dialog units into pixels.
			-- Used to get the same look&feel under all platforms
		do
			Result := layout_implementation.dialog_unit_to_pixels (a_size)
		end
		
feature {NONE} -- Implementation

	layout_implementation: EV_LAYOUT_CONSTANTS_IMP is
			-- Underlying implementation
		once
			create Result
		end

end -- class EV_LAYOUT_CONSTANTS
