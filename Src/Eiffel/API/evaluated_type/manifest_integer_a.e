﻿note
	description: "Actual type for integer constant types."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	MANIFEST_INTEGER_A

inherit
	INTEGER_A
		redefine
			convert_to, intrinsic_type, process
		end
	INTEGER_TYPE_MASKS
	SHARED_TYPES

create
	make_for_constant

feature {NONE} -- Initialization

	make_for_constant (n: like size; possible_types: INTEGER)
			-- Create instance of INTEGER_A represented by `n' bits
			-- whose value can also be of a type taken from `possible_types'.
		require
			valid_n: n = 32 or n = 64
			valid_possible_types:
				possible_types & (
					integer_8_mask | integer_16_mask | integer_32_mask | integer_64_mask |
					natural_8_mask | natural_16_mask | natural_32_mask | natural_64_mask
				).bit_not = 0
			consistent_integer_32: n = 32 implies (possible_types & integer_32_mask) /= 0
			consistent_integer_64: n = 64 implies (possible_types & integer_64_mask) /= 0
		do
			make (n)
			integer_types := possible_types
		ensure
			size_set: size = n
			types_set: integer_types = possible_types
		end

feature -- Visitor

	process (v: TYPE_A_VISITOR)
			-- Process current element.
		do
			v.process_manifest_integer_a (Current)
		end

feature -- Property

	intrinsic_type: INTEGER_A
			-- Real type of current manifest integer.
			-- To preserve compatibility with ETL2, a manifest
			-- integer is always at least 32 bits wide.
		do
			inspect size
			when 32 then Result := integer_type
			when 64 then Result := integer_64_type
			end
		end

feature {COMPILER_EXPORTER} -- Implementation

	convert_to (a_context_class: CLASS_C; a_target_type: TYPE_A): BOOLEAN
			-- Does current convert to `a_target_type' in `a_context_class'?
			-- Update `last_conversion_info' of AST_CONTEXT.
		do
			if attached {INTEGER_A} a_target_type as l_int then
				if (integer_types & integer_mask (l_int.size)) /= 0 then
					context.set_last_conversion_info (create {NULL_CONVERSION_INFO}.make (l_int))
					Result := True
				end
			elseif attached {NATURAL_A} a_target_type as l_nat then
				if (integer_types & natural_mask (l_nat.size)) /= 0 then
					context.set_last_conversion_info (create {NULL_CONVERSION_INFO}.make (l_nat))
					Result := True
				end
			else
				Result := Precursor (a_context_class, a_target_type)
			end
		end

feature {NONE} -- Implementation

	integer_types: INTEGER
			-- Possible types of integer constant
			-- (Combination of bit masks `integer_..._mask' and `natural_..._mask')

invariant
	correct_size: size = 32 or size = 64
	valid_types:
		integer_types & (
			integer_8_mask | integer_16_mask | integer_32_mask | integer_64_mask |
			natural_8_mask | natural_16_mask | natural_32_mask | natural_64_mask
		).bit_not = 0

note
	copyright:	"Copyright (c) 1984-2015, Eiffel Software"
	license:	"GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options:	"http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful, but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
		]"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
