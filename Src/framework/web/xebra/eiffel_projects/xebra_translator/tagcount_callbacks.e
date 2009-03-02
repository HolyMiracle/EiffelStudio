note
	description: "Summary description for {TAGCOUNT_CALLBACKS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
class TAGCOUNT_CALLBACKS

inherit

	XM_CALLBACKS_NULL
		redefine
			on_start,
			on_start_tag
		end

create

	make

feature -- Events

	on_start is
			-- Reset tag count.
		do
			count := 0
		end

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Count start tags.
		do
			count := count + 1
		end

feature -- Access

	count: INTEGER
			-- Number of tags seen.

end
