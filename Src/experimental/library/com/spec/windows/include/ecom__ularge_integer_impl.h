/*
indexing
	description: "EiffelCOM: library of reusable components for COM."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"
*/

/*-----------------------------------------------------------
"Automatically generated by the EiffelCOM Wizard."Added Record _ULARGE_INTEGER
  QuadPart: ULONGLONG
      -- No description available.
  
-----------------------------------------------------------*/

#ifndef __ECOM__ULARGE_INTEGER_IMPL_H__
#define __ECOM__ULARGE_INTEGER_IMPL_H__


#include "eif_eiffel.h"


#ifdef __cplusplus
extern "C" {
#endif



#ifdef __cplusplus

#define ccom_x_ularge_integer_quad_part(_ptr_) (EIF_INTEGER_64)(ULONGLONG)(((ULARGE_INTEGER *)_ptr_)->QuadPart)

#define ccom_x_ularge_integer_set_quad_part(_ptr_, _field_) ((((ULARGE_INTEGER *)_ptr_)->QuadPart) = (ULONGLONG)_field_)

#endif
#ifdef __cplusplus
}
#endif

#endif
