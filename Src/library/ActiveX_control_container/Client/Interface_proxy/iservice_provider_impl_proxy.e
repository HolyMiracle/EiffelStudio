note
	description: "Implemented `IServiceProvider' Interface."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	Note: "Automatically generated by the EiffelCOM Wizard."

class
	ISERVICE_PROVIDER_IMPL_PROXY

inherit
	ISERVICE_PROVIDER_INTERFACE

	ECOM_QUERIABLE

create
	make_from_other,
	make_from_pointer

feature {NONE}  -- Initialization

	make_from_pointer (cpp_obj: POINTER)
			-- Make from pointer
		do
			initializer := ccom_create_iservice_provider_impl_proxy_from_pointer(cpp_obj)
			item := ccom_item (initializer)
		end

feature -- Basic Operations

	query_service (guid_service: ECOM_GUID; riid: ECOM_GUID; ppv_object: CELL [ECOM_INTERFACE])
			-- No description available.
			-- `guid_service' [in].  
			-- `riid' [in].  
			-- `ppv_object' [out].  
		do
			ccom_query_service (initializer, guid_service.item, riid.item, ppv_object)
		end

feature {NONE}  -- Implementation

	delete_wrapper
			-- Delete wrapper
		do
			ccom_delete_iservice_provider_impl_proxy(initializer)
		end

feature {NONE}  -- Externals

	ccom_query_service (cpp_obj: POINTER; guid_service: POINTER; riid: POINTER; ppv_object: CELL [ECOM_INTERFACE])
			-- No description available.
		external
			"C++ [ecom_control_library::IServiceProvider_impl_proxy %"ecom_control_library_IServiceProvider_impl_proxy_s.h%"](GUID *,GUID *,EIF_OBJECT)"
		end

	ccom_delete_iservice_provider_impl_proxy (a_pointer: POINTER)
			-- Release resource
		external
			"C++ [delete ecom_control_library::IServiceProvider_impl_proxy %"ecom_control_library_IServiceProvider_impl_proxy_s.h%"]()"
		end

	ccom_create_iservice_provider_impl_proxy_from_pointer (a_pointer: POINTER): POINTER
			-- Create from pointer
		external
			"C++ [new ecom_control_library::IServiceProvider_impl_proxy %"ecom_control_library_IServiceProvider_impl_proxy_s.h%"](IUnknown *)"
		end

	ccom_item (cpp_obj: POINTER): POINTER
			-- Item
		external
			"C++ [ecom_control_library::IServiceProvider_impl_proxy %"ecom_control_library_IServiceProvider_impl_proxy_s.h%"]():EIF_POINTER"
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




end -- ISERVICE_PROVIDER_IMPL_PROXY

