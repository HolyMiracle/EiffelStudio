note
	description: "Control interfaces. Help file: "
	legal: "See notice at end of class."
	status: "See notice at end of class."
	generator: "Automatically generated by the EiffelCOM Wizard."

class
	TAG_STATDATA_RECORD

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

	formatetc: TAG_FORMATETC_RECORD
			-- No description available.
		do
			Result := ccom_tag_statdata_formatetc (item)
		ensure
			valid_formatetc: Result.item /= default_pointer
		end

	advf: INTEGER
			-- No description available.
		do
			Result := ccom_tag_statdata_advf (item)
		end

	p_adv_sink: IADVISE_SINK_INTERFACE
			-- No description available.
		do
			Result := ccom_tag_statdata_p_adv_sink (item)
		end

	dw_connection: INTEGER
			-- No description available.
		do
			Result := ccom_tag_statdata_dw_connection (item)
		end

feature -- Measurement

	structure_size: INTEGER
			-- Size of structure
		do
			Result := c_size_of_tag_statdata
		end

feature -- Basic Operations

	set_formatetc (a_formatetc: TAG_FORMATETC_RECORD)
			-- Set `formatetc' with `a_formatetc'.
		require
			non_void_a_formatetc: a_formatetc /= Void
			valid_a_formatetc: a_formatetc.item /= default_pointer
		do
			ccom_tag_statdata_set_formatetc (item, a_formatetc.item)
		end

	set_advf (a_advf: INTEGER)
			-- Set `advf' with `a_advf'.
		do
			ccom_tag_statdata_set_advf (item, a_advf)
		end

	set_p_adv_sink (a_p_adv_sink: IADVISE_SINK_INTERFACE)
			-- Set `p_adv_sink' with `a_p_adv_sink'.
		do
			ccom_tag_statdata_set_p_adv_sink (item, a_p_adv_sink.item)
		end

	set_dw_connection (a_dw_connection: INTEGER)
			-- Set `dw_connection' with `a_dw_connection'.
		do
			ccom_tag_statdata_set_dw_connection (item, a_dw_connection)
		end

feature {NONE}  -- Externals

	c_size_of_tag_statdata: INTEGER
			-- Size of structure
		external
			"C [macro %"ecom_control_library_tagSTATDATA_s.h%"]"
		alias
			"sizeof(ecom_control_library::tagSTATDATA)"
		end

	ccom_tag_statdata_formatetc (a_pointer: POINTER): TAG_FORMATETC_RECORD
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagSTATDATA_s_impl.h%"](ecom_control_library::tagSTATDATA *):EIF_REFERENCE"
		end

	ccom_tag_statdata_set_formatetc (a_pointer: POINTER; arg2: POINTER)
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagSTATDATA_s_impl.h%"](ecom_control_library::tagSTATDATA *, ecom_control_library::tagFORMATETC *)"
		end

	ccom_tag_statdata_advf (a_pointer: POINTER): INTEGER
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagSTATDATA_s_impl.h%"](ecom_control_library::tagSTATDATA *):EIF_INTEGER"
		end

	ccom_tag_statdata_set_advf (a_pointer: POINTER; arg2: INTEGER)
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagSTATDATA_s_impl.h%"](ecom_control_library::tagSTATDATA *, ULONG)"
		end

	ccom_tag_statdata_p_adv_sink (a_pointer: POINTER): IADVISE_SINK_INTERFACE
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagSTATDATA_s_impl.h%"](ecom_control_library::tagSTATDATA *):EIF_REFERENCE"
		end

	ccom_tag_statdata_set_p_adv_sink (a_pointer: POINTER; arg2: POINTER)
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagSTATDATA_s_impl.h%"](ecom_control_library::tagSTATDATA *, ::IAdviseSink *)"
		end

	ccom_tag_statdata_dw_connection (a_pointer: POINTER): INTEGER
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagSTATDATA_s_impl.h%"](ecom_control_library::tagSTATDATA *):EIF_INTEGER"
		end

	ccom_tag_statdata_set_dw_connection (a_pointer: POINTER; arg2: INTEGER)
			-- No description available.
		external
			"C++ [macro %"ecom_control_library_tagSTATDATA_s_impl.h%"](ecom_control_library::tagSTATDATA *, ULONG)"
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




end -- TAG_STATDATA_RECORD

