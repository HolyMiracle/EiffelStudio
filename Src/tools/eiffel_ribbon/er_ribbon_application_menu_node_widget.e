note
	description: "EiffelVision Widget ER_RIBBON_APPLICATION_MENU_NODE_WIDGET.%
		%The original version of this class was generated by EiffelBuild."
	generator: "EiffelBuild"
	date: "$Date$"
	revision: "$Revision$"

class
	ER_RIBBON_APPLICATION_MENU_NODE_WIDGET

inherit
	ER_RIBBON_APPLICATION_MENU_NODE_WIDGET_IMP


feature {NONE} -- Initialization

	user_create_interface_objects
			-- Create any auxilliary objects needed for ER_RIBBON_APPLICATION_MENU_NODE_WIDGET.
			-- Initialization for these objects must be performed in `user_initialization'.
		do
		end

	user_initialization
			-- Perform any initialization on objects created by `user_create_interface_objects'
			-- and from within current class itself.
		do
				-- Initialize types defined in current class
			common_node.node_type.set_text ("Application menu")
		end

feature -- Query

	set_tree_node_data (a_data: detachable ER_TREE_NODE_APPLICATION_MENU_DATA)
			-- Update GUI with tree node data
		do
			tree_node_data := a_data
			if attached a_data as l_data then
				common_node.set_tree_node_data (a_data)
				max_count.set_text (a_data.max_count.out)
				if a_data.enable_pinning then
					enable_pinning.enable_select
				else
					enable_pinning.disable_select
				end

			end
		end

feature {NONE} -- Implementation

	on_max_count_change
			-- Called by `change_actions' of `max_count'.
		do
			if attached tree_node_data as l_data then
				l_data.set_max_count (max_count.text.to_integer)
			end
		end

	on_enable_pinning_select
			-- <Precursor>
		do
			if attached tree_node_data as l_data then
				if enable_pinning.is_selected then
					l_data.set_enable_pinning (True)
				else
					l_data.set_enable_pinning (False)
				end
			end
		end

	tree_node_data: detachable ER_TREE_NODE_APPLICATION_MENU_DATA
			-- Application menu tree node data


;note
	copyright: "Copyright (c) 1984-2014, Eiffel Software"
	license: "GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
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
