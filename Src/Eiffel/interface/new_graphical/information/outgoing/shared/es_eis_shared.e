note
	description: "Object that holds all shared eis assistant access."
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	ES_EIS_SHARED

inherit
	EB_SHARED_WRITER

	ES_SHARED_FONTS_AND_COLORS

feature -- Access

	id_solution: EB_SHARED_ID_SOLUTION
			-- ID solution
		once
			create Result
		ensure
			Result_not_void: Result /= Void
		end

	icon_factory: EB_PIXMAPABLE_ITEM_PIXMAP_FACTORY
			-- Icon factory
		once
			create Result
		ensure
			Result_not_void: Result /= Void
		end

	eis_output: ES_EIS_ENTRY_OUTPUT
			-- EIS output
			-- Entry to codes.
		once
			create Result
		ensure
			Result_not_void: Result /= Void
		end

	storage: EIS_STORAGE
			-- Shared EIS storage
		once
			create Result.make
		ensure
			Result_not_void: Result /= Void
		end

	entry_factory: ES_EIS_ENTRY_FACTORY
			-- Entry factory
		once
			create Result
		ensure
			Result_not_void: Result /= Void
		end

	eis_variables: ES_EIS_VARIABLES
			-- Shared EIS variables
		once
			create Result
		ensure
			Result_not_void: Result /= Void
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software"
	license:   "GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options: "http://www.eiffel.com/licensing"
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
