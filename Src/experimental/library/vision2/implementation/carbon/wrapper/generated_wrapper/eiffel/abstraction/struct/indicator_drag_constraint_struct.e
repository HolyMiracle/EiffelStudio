-- This file has been generated by EWG. Do not edit. Changes will be lost!

class INDICATOR_DRAG_CONSTRAINT_STRUCT

inherit

	EWG_STRUCT

	INDICATOR_DRAG_CONSTRAINT_STRUCT_EXTERNAL
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

	limitrect: POINTER is
			-- Access member `limitRect'
		require
			exists: exists
		do
			Result := get_limitrect_external (item)
		ensure
			result_correct: Result = get_limitrect_external (item)
		end

	set_limitrect (a_value: POINTER) is
			-- Set member `limitRect'
		require
			exists: exists
		do
			set_limitrect_external (item, a_value)
		end

	sloprect: POINTER is
			-- Access member `slopRect'
		require
			exists: exists
		do
			Result := get_sloprect_external (item)
		ensure
			result_correct: Result = get_sloprect_external (item)
		end

	set_sloprect (a_value: POINTER) is
			-- Set member `slopRect'
		require
			exists: exists
		do
			set_sloprect_external (item, a_value)
		end

	axis: INTEGER is
			-- Access member `axis'
		require
			exists: exists
		do
			Result := get_axis_external (item)
		ensure
			result_correct: Result = get_axis_external (item)
		end

	set_axis (a_value: INTEGER) is
			-- Set member `axis'
		require
			exists: exists
		do
			set_axis_external (item, a_value)
		ensure
			a_value_set: a_value = axis
		end

end