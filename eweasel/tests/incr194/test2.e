
--| Copyright (c) 1993-2006 University of Southern California and contributors.
--| All rights reserved.
--| Your use of this work is governed under the terms of the GNU General
--| Public License version 2.

expanded class TEST2
inherit
	TEST1
create
	default_create
feature

	try is
		do
			print ((agent stoat).item ([]));
			io.new_line
		end
	
end
