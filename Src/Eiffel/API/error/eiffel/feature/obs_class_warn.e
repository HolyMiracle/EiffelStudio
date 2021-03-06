﻿note
	description: "Warning for obsolete features."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision $"

class OBS_CLASS_WARN

inherit
	EIFFEL_WARNING
		redefine
			build_explain,
			error_string,
			help_file_name,
			is_defined,
			print_single_line_error_message
		end

	EIFFEL_ERROR
		rename
			class_c as associated_class
		undefine
			associated_class_type,
			has_associated_file,
			help_file_name,
			is_defined,
			print_single_line_error_message
		redefine
			build_explain,
			error_string
		end

create
	make_with_class

feature {NONE} -- Initialization

	make_with_class (c: CLASS_C)
			-- Instanciate with class `c'
		require
			c_attached: c /= Void
		do
			set_class (c)
		end

feature -- Status report

	is_error: BOOLEAN
			-- Does current represent an error?

feature -- Status setting

	set_error
			-- Treat the issue as an error.
		do
			is_error := True
		ensure
			is_error
		end

feature -- Properties

	error_string: like {ERROR}.error_string
		do
			Result :=
				if is_error then
					Precursor {EIFFEL_ERROR}
				else
					Precursor {EIFFEL_WARNING}
				end
		end

	obsolete_class: CLASS_C
			-- Obsolete class

	associated_feature: E_FEATURE
			-- Feature using the obsolete

	code: STRING
			-- Error code
		do
			Result := "Obsolete Class"
		end

	help_file_name: STRING
		do
			Result := "OBS_CLASS"
		end

feature -- Access

	is_defined: BOOLEAN
			-- Is the error fully defined?
		do
			Result := classes_defined
		end

	classes_defined: BOOLEAN
			-- Is the feature defined for error?
		do
			Result := associated_class /= Void and then
				obsolete_class /= Void
		ensure
			yes_implies_valid_classes: Result implies
							associated_class /= Void and then
							obsolete_class /= Void
		end

feature -- Output

	build_explain (a_text_formatter: TEXT_FORMATTER)
		local
			m: STRING_32
		do
			a_text_formatter.add ("Class: ")
			associated_class.append_name (a_text_formatter)
			a_text_formatter.add_new_line
			if associated_feature /= Void then
				a_text_formatter.add ("Feature: ")
				associated_feature.append_name (a_text_formatter)
				a_text_formatter.add_new_line
			end
			a_text_formatter.add ("Obsolete class: ")
			obsolete_class.append_name (a_text_formatter)
			a_text_formatter.add_new_line
			a_text_formatter.add ("Obsolete message: ")
			m := obsolete_class.obsolete_message_32
			if m.has ('%N') then
					-- Preserve formatting for multi-line message
				a_text_formatter.add_new_line
			end
			a_text_formatter.add_multiline_string (m, 1)
			a_text_formatter.add_new_line
		end

feature {NONE} -- Output

	print_single_line_error_message (a_text_formatter: TEXT_FORMATTER)
			-- Displays single line help in `a_text_formatter'.
		do
			Precursor (a_text_formatter)
			print_single_line_error_message_extended (a_text_formatter)
		end

	print_single_line_error_message_extended (a_text_formatter: TEXT_FORMATTER)
			-- Displays single line help in `a_text_formatter'.
		local
			l_message: STRING_32
		do
			a_text_formatter.add (" Use of class ")
			obsolete_class.append_name (a_text_formatter)
			l_message := obsolete_class.obsolete_message_32
			if l_message /= Void and then not l_message.is_empty then
				l_message.replace_substring_all ({STRING_32} "%T", {STRING_32} "")
				l_message.replace_substring_all ({STRING_32} "%N", {STRING_32} " ")
				a_text_formatter.add (": ")
				a_text_formatter.add (l_message)
			else
				a_text_formatter.add (".")
			end
		end

feature {COMPILER_EXPORTER}

	set_obsolete_class (c: CLASS_C)
		require
			valid_c: c /= Void
		do
			obsolete_class := c
		end

	set_feature (f: FEATURE_I)
			-- Assign `f' to `feature'
		require
			f_not_void: f /= Void
			valid_associated_class: associated_class /= Void
		do
			associated_feature := f.enclosing_feature.api_feature (associated_class.class_id)
		ensure
			associated_feature_not_void: associated_feature /= Void
		end

note
	copyright:	"Copyright (c) 1984-2018, Eiffel Software"
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
