
-- Parent of any oui graphic class.

indexing

	date: "$Date$";
	revision: "$Revision$"

class G_ANY

feature {NONE}

	init_toolkit: like toolkit is
			-- Init toolkit to desired implementation.
		do
		end; -- init_toolkit

	toolkit: TOOLKIT is
			-- Toolkit of implementation in the environment desired
		once
			Result := init_toolkit
		ensure
			not (Result = Void)
		end -- toolkit

end


--|----------------------------------------------------------------
--| EiffelVision: library of reusable components for ISE Eiffel 3.
--| Copyright (C) 1989, 1991, 1993, Interactive Software
--|   Engineering Inc.
--| All rights reserved. Duplication and distribution prohibited.
--|
--| 270 Storke Road, Suite 7, Goleta, CA 93117 USA
--| Telephone 805-685-1006
--| Fax 805-685-6869
--| Electronic mail <info@eiffel.com>
--| Customer support e-mail <eiffel@eiffel.com>
--|----------------------------------------------------------------
