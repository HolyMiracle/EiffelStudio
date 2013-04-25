-- This file has been generated by EWG. Do not edit. Changes will be lost!

class HIBINDING_STRUCT

inherit

	EWG_STRUCT

	HIBINDING_STRUCT_EXTERNAL
		export
			{NONE} all
		end

create

	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared

feature {ANY} -- Access

	sizeof: INTEGER is
		do
			Result := sizeof_external
		end

feature {ANY} -- Member Access

	top: POINTER is
			-- Access member `top'
		require
			exists: exists
		do
			Result := get_top_external (item)
		ensure
			result_correct: Result = get_top_external (item)
		end

	set_top (a_value: POINTER) is
			-- Set member `top'
		require
			exists: exists
		do
			set_top_external (item, a_value)
		end

	left: POINTER is
			-- Access member `left'
		require
			exists: exists
		do
			Result := get_left_external (item)
		ensure
			result_correct: Result = get_left_external (item)
		end

	set_left (a_value: POINTER) is
			-- Set member `left'
		require
			exists: exists
		do
			set_left_external (item, a_value)
		end

	bottom: POINTER is
			-- Access member `bottom'
		require
			exists: exists
		do
			Result := get_bottom_external (item)
		ensure
			result_correct: Result = get_bottom_external (item)
		end

	set_bottom (a_value: POINTER) is
			-- Set member `bottom'
		require
			exists: exists
		do
			set_bottom_external (item, a_value)
		end

	right: POINTER is
			-- Access member `right'
		require
			exists: exists
		do
			Result := get_right_external (item)
		ensure
			result_correct: Result = get_right_external (item)
		end

	set_right (a_value: POINTER) is
			-- Set member `right'
		require
			exists: exists
		do
			set_right_external (item, a_value)
		end

end