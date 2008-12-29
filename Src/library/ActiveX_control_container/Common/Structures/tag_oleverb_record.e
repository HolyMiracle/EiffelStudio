note
	description: "Control interfaces. Help file: "
	legal: "See notice at end of class."
	status: "See notice at end of class."
	Note: "Automatically generated by the EiffelCOM Wizard."

class
	TAG_OLEVERB_RECORD

inherit
	ECOM_STRUCTURE
		redefine
			make
		end

create
	make,
	make_from_pointer

feature {NONE}  -- Initialization

	make
			-- Make.
		do
			Precursor {ECOM_STRUCTURE}
		end

	make_from_pointer (a_pointer: POINTER)
			-- Make from pointer.
		do
			make_by_pointer (a_pointer)
		end

feature -- Access

	l_verb: INTEGER
			-- No description available.
		do
			Result := ccom_tag_oleverb_l_verb (item)
		end

	lpsz_verb_name: STRING
			-- No description available.
		do
			Result := ccom_tag_oleverb_lpsz_verb_name (item)
		end

	fu_flags: INTEGER
			-- No description available.
		do
			Result := ccom_tag_oleverb_fu_flags (item)
		end

	grf_attribs: INTEGER
			-- No description available.
		do
			Result := ccom_tag_oleverb_grf_attribs (item)
		end

feature -- Measurement

	structure_size: INTEGER
			-- Size of structure
		do
			Result := c_size_of_tag_oleverb
		end

feature -- Basic Operations

	set_l_verb (a_l_verb: INTEGER)
			-- Set `l_verb' with `a_l_verb'.
		do
			ccom_tag_oleverb_set_l_verb (item, a_l_verb)
		end

	set_lpsz_verb_name (a_lpsz_verb_name: STRING)
			-- Set `lpsz_verb_name' with `a_lpsz_verb_name'.
		do
			ccom_tag_oleverb_set_lpsz_verb_name (item, a_lpsz_verb_name)
		end

	set_fu_flags (a_fu_flags: INTEGER)
			-- Set `fu_flags' with `a_fu_flags'.
		do
			ccom_tag_oleverb_set_fu_flags (item, a_fu_flags)
		end

	set_grf_attribs (a_grf_attribs: INTEGER)
			-- Set `grf_attribs' with `a_grf_attribs'.
		do
			ccom_tag_oleverb_set_grf_attribs (item, a_grf_attribs)
		end

feature {NONE}  -- Externals

	c_size_of_tag_oleverb: INTEGER
			-- Size of structure
		external
			"C [macro %"ecom_control_library_tagOLEVERB_s.h%"]"
		alias
			"sizeof(ecom_control_library::tagOLEVERB)"
		end

	ccom_tag_oleverb_l_verb (a_pointer: POINTER): INTEGER
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagOLEVERB_s_impl.h%"](ecom_control_library::tagOLEVERB *):EIF_INTEGER"
		end

	ccom_tag_oleverb_set_l_verb (a_pointer: POINTER; arg2: INTEGER)
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagOLEVERB_s_impl.h%"](ecom_control_library::tagOLEVERB *, LONG)"
		end

	ccom_tag_oleverb_lpsz_verb_name (a_pointer: POINTER): STRING
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagOLEVERB_s_impl.h%"](ecom_control_library::tagOLEVERB *):EIF_REFERENCE"
		end

	ccom_tag_oleverb_set_lpsz_verb_name (a_pointer: POINTER; arg2: STRING)
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagOLEVERB_s_impl.h%"](ecom_control_library::tagOLEVERB *, EIF_OBJECT)"
		end

	ccom_tag_oleverb_fu_flags (a_pointer: POINTER): INTEGER
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagOLEVERB_s_impl.h%"](ecom_control_library::tagOLEVERB *):EIF_INTEGER"
		end

	ccom_tag_oleverb_set_fu_flags (a_pointer: POINTER; arg2: INTEGER)
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagOLEVERB_s_impl.h%"](ecom_control_library::tagOLEVERB *, ULONG)"
		end

	ccom_tag_oleverb_grf_attribs (a_pointer: POINTER): INTEGER
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagOLEVERB_s_impl.h%"](ecom_control_library::tagOLEVERB *):EIF_INTEGER"
		end

	ccom_tag_oleverb_set_grf_attribs (a_pointer: POINTER; arg2: INTEGER)
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagOLEVERB_s_impl.h%"](ecom_control_library::tagOLEVERB *, ULONG)"
		end

note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"




end -- TAG_OLEVERB_RECORD

