indexing

	description:

		"Platform-dependent properties"

	usage:      "This class should not be used directly through %
				%inheritance and client/supplier relationship. %
				%Inherit from KL_SHARED_PLATFORM instead."
	pattern:    "Singleton"
	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_PLATFORM

inherit

	PLATFORM

feature -- Access

	Minimum_character_code: INTEGER is 0
	Maximum_character_code: INTEGER is 255
			-- Smallest and largest supported codes for CHARACTER values

end -- class KL_PLATFORM
