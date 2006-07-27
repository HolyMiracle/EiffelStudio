indexing
	description: "Objects that represent an EV_TITLED_WINDOW.%
		%The original version of this class was generated by EiffelBuild."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	EB_METRIC_EVALUATION_PANEL

inherit
	EB_METRIC_EVALUATION_PANEL_IMP

	EB_CONSTANTS
		undefine
			is_equal,
			copy,
			default_create
		end

	QL_SHARED_UNIT
		undefine
			is_equal,
			copy,
			default_create
		end

	EB_METRIC_PANEL
		undefine
			is_equal,
			copy,
			default_create
		end

	EB_METRIC_INTERFACE_PROVIDER
		undefine
			is_equal,
			copy,
			default_create
		end

	EB_METRIC_SHARED
		undefine
			is_equal,
			copy,
			default_create
		end

	EXCEPTIONS
		undefine
			is_equal,
			copy,
			default_create
		end

	EB_SHARED_PREFERENCES
		undefine
			is_equal,
			copy,
			default_create
		end

create
	make

feature{NONE} -- Initialization

	make (a_tool: like metric_tool) is
			-- Initialize `metric_tool' with `a_tool'.
		require
			a_tool_attached: a_tool /= Void
		do
			metric_tool := a_tool
			default_create
			create {QL_TARGET_DOMAIN_GENERATOR} domain_generator_internal
		ensure
			metric_tool_set: metric_tool = a_tool
			domain_generator_internal_attached: domain_generator_internal /= Void
		end

feature {NONE} -- Initialization

	user_initialization is
			-- Called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		local
			l_text: EV_TEXT
		do
				-- Setup basic metric definition area.
			create metric_definer.make (metric_tool)
			metric_definer.change_actions_internal.extend (agent on_definition_change)
			metric_definer.hide_name_area
			criterion_area.extend (metric_definer.widget)

				-- Initialize unit list.
			initialize_unit

				-- Setup metric list grid.	
			create metric_selector.make (False)
			grid_wrapper.extend (metric_selector)
			grid_wrapper.set_minimum_width (250)

				-- Setup domain selector.
			create domain_selector
			domain_selector.set_minimum_width (300)
			domain_selector.disable_delayed_domain
			metric_domain_selector_area.extend (domain_selector)
			domain_selector.domain_change_actions.extend (agent on_domain_change)
			metric_selector.metric_selected_actions.extend (agent on_metric_selected)
			metric_selector.group_selected_actions.extend (agent on_metric_selected (Void))

				-- Setup sensitivity and background color for text fields
			metric_value_text.disable_edit
			create l_text
			metric_value_text.set_background_color (l_text.background_color)
			metric_value_text.implementation.hide_border

				-- Setup run tool bar
			run_metric_btn.set_pixmap (pixmaps.icon_pixmaps.debug_run_icon)
			run_metric_btn.set_tooltip (metric_names.f_run)
			run_metric_btn.select_actions.extend (agent on_run_metric (False))
			run_metric_btn.disable_sensitive

			run_with_detail_metric_btn.set_pixmap (pixmaps.icon_pixmaps.metric_run_and_show_details_icon)
			run_with_detail_metric_btn.select_actions.extend (agent on_run_metric (True))
			run_with_detail_metric_btn.set_tooltip (metric_names.f_show_detailed_result)

			stop_metric_btn.set_pixmap (pixmaps.icon_pixmaps.debug_stop_icon)
			stop_metric_btn.disable_sensitive
			stop_metric_btn.set_tooltip (metric_names.f_stop)
			stop_metric_btn.select_actions.extend (agent on_stop_metric_evaluation_button_pressed)


			go_to_definition_btn.select_actions.extend (agent on_go_to_definition_button_pressed)
			go_to_definition_btn.remove_text
			go_to_definition_btn.set_pixmap (pixmaps.icon_pixmaps.command_go_to_definition_icon)
			go_to_definition_btn.set_tooltip (metric_names.f_go_to_definition)
			go_to_definition_btn.disable_sensitive

			quick_metric_btn.set_pixmap (pixmaps.icon_pixmaps.metric_quick_icon)
			on_metric_selected (Void)
			display_metric

			quick_metric_btn.select_actions.extend (agent on_quick_metric_button_pressed)
			quick_metric_btn.disable_select
			quick_metric_btn.set_tooltip (metric_names.f_quick_metric_definition)

			choose_input_domain_lbl.set_text (metric_names.l_select_input_domain)
			choose_metric_lbl.set_text (metric_names.l_select_metric)
			metric_value_lbl.set_text (metric_names.e_value)

			reload_btn.set_pixmap (pixmaps.icon_pixmaps.general_open_icon)
			reload_btn.set_tooltip (metric_names.f_reload_metrics)
			reload_btn.select_actions.extend (agent on_reload_metrics)
			reload_btn.pointer_button_press_actions.extend (agent on_open_user_defined_metric_file)
			choose_input_domain_lbl.set_text (metric_names.t_select_source_domain)
			choose_metric_lbl.set_text (metric_names.t_select_metric)
		end

feature -- Access

	current_metric: EB_METRIC
			-- Current selected metric

feature -- Status report

	is_metric_running: BOOLEAN
			-- Is metric running?

	is_cancel_evaluation_requested: BOOLEAN
			-- Is cancel metric evaluation requested?

	is_using_quick_metric: BOOLEAN is
			-- Is using quick metric?
		do
			Result := quick_metric_btn.is_selected
		end

	is_current_metric_valid: BOOLEAN is
			-- Is `current_metric' valid?
		do
			if current_metric /= Void then
				if is_using_quick_metric then
					metric_vadility_checker.process_metric (current_metric)
					Result := not metric_vadility_checker.has_error
				else
					Result := metric_manager.is_metric_valid (current_metric.name)
				end
			end
		end

	is_compiling: BOOLEAN is
			-- Is Eiffel compilation under-going?
		do
			Result := metric_tool.is_compiling
		end

	is_stopped_by_eiffel_compilation: BOOLEAN
			-- Is metric evaluation stopped by Eiffel compilation?

	is_quick_metric_initialized: BOOLEAN
			-- Is quick metric initialized?

feature -- Basic operations

	synchronize_when_compile_start is
			-- Synchronize when Eiffel compilation starts.
		do
			run_metric_btn.disable_sensitive
			run_with_detail_metric_btn.disable_sensitive
			stop_metric_btn.disable_sensitive
			domain_selector.disable_sensitive
			go_to_definition_btn.disable_sensitive
			metric_selector.disable_sensitive
			metric_definer.disable_sensitive
			unit_combo.disable_sensitive
			quick_metric_btn.disable_sensitive
			reload_btn.disable_sensitive
		end

	synchronize_when_compile_stop is
			-- Synchronize when Eiffel compilation stops.
		do
			quick_metric_btn.enable_sensitive
			domain_selector.enable_sensitive
			metric_selector.enable_sensitive
			if current_metric /= Void then
				go_to_definition_btn.disable_sensitive
			else
				go_to_definition_btn.enable_sensitive
			end
			unit_combo.enable_sensitive
			metric_definer.enable_sensitive
			stop_metric_btn.disable_sensitive
			reload_btn.enable_sensitive
			display_metric
		end

	synchronize_when_metric_evaluation_start is
			-- Synchronize when metric evaluation starts.
		do
			run_metric_btn.disable_sensitive
			run_with_detail_metric_btn.disable_sensitive
			stop_metric_btn.enable_sensitive
			domain_selector.disable_sensitive
			go_to_definition_btn.disable_sensitive
			quick_metric_btn.disable_sensitive
			metric_value_text.set_text (metric_names.e_evaluating_value)
			unit_combo.disable_sensitive
			metric_definer.disable_sensitive
			reload_btn.disable_sensitive
			metric_selector.disable_sensitive
		end

	synchronize_when_metric_evaluation_stop is
			-- Synchronize when metric evaluation stops.
		require
			current_metric_attached: current_metric /= Void
		do
			domain_selector.enable_sensitive
			go_to_definition_btn.enable_sensitive
			run_metric_btn.enable_sensitive
			stop_metric_btn.disable_sensitive
			quick_metric_btn.enable_sensitive
			if current_metric.is_result_domain_available then
				run_with_detail_metric_btn.enable_sensitive
			end
			unit_combo.enable_sensitive
			metric_definer.enable_sensitive
			reload_btn.enable_sensitive
			metric_selector.enable_sensitive
		end

feature -- Actions

	on_metric_selected (a_metric: EB_METRIC) is
			-- Action to be performed when a metric is selected in `metric_selector'
		do
			current_metric := a_metric
			display_metric
		end

	on_run_metric (a_detailed: BOOLEAN) is
			-- Action to be performed when run a metric			
			-- If `a_detailed' is True, record detailed result when calculating `current_metric'.
		require
			current_metric_attached: current_metric /= Void
			current_metric_is_valid: is_current_metric_valid
		local
			l_retried: BOOLEAN
			l_value: DOUBLE
			l_metric_basic: EB_METRIC_BASIC
		do
			if not l_retried then
				synchronize_when_metric_evaluation_start
				setup_evaluation_environment (True)

				is_cancel_evaluation_requested := False
				is_metric_running := True
				is_stopped_by_eiffel_compilation := False

					-- Setup metric evaluator.
				if a_detailed then
					current_metric.enable_fill_domain
						-- Special setting for metric of line unit.
					if current_metric.is_basic and then current_metric.unit = line_unit then
						l_metric_basic ?= current_metric
						l_metric_basic.set_criteria (criterion_factory.metric_criterion (line_scope, query_language_names.ql_cri_true))
					end
				else
					current_metric.disable_fill_domain
				end

				l_value := current_metric.value (domain_selector.domain).first.value
				display_status_message ("")
				is_metric_running := False
				metric_value_text.set_text (l_value.out)
				if current_metric.is_fill_domain_enabled then
					metric_tool.register_metric_result_for_display (current_metric, domain_selector.domain, l_value, current_metric.last_result_domain)
				else
					metric_tool.register_metric_result_for_display (current_metric, domain_selector.domain, l_value, Void)
				end
				if a_detailed then
					metric_tool.go_to_result
				end
			end
			setup_evaluation_environment (False)
			if is_compiling then
				synchronize_when_compile_start
			else
				synchronize_when_metric_evaluation_stop
			end
		rescue
			l_retried := True
			display_status
			metric_value_text.set_text (metric_names.e_undefined_value)
			setup_evaluation_environment (False)
			is_metric_running := False
			retry
		end

	on_stop_metric_evaluation (a_item: QL_ITEM) is
			-- Action to be performed when metric evaluation is stopped
		do
			if is_cancel_evaluation_requested then
				if is_stopped_by_eiffel_compilation then
					stop_metric_evaluation (metric_names.e_interrupted_by_compile)
				else
					stop_metric_evaluation (metric_names.e_interrupted_by_user)
				end
			end
		end

	on_stop_metric_evaluation_button_pressed is
			-- Action to be performed when stop button is pressed.
		do
			is_cancel_evaluation_requested := True
		end

	on_select is
			-- Action to be performed when current is selected
		do
		end

	on_go_to_definition_button_pressed is
			-- Action to be performed when "Go to definition" button is pressed
		do
			if is_using_quick_metric then
				if current_metric /= Void then
					metric_tool.go_to_definition (current_metric, True)
				end
			else
				if
					metric_selector.last_selected_metric /= Void and then
					metric_manager.has_metric (metric_selector.last_selected_metric)
				then
					metric_tool.go_to_definition (metric_manager.metric_with_name (metric_selector.last_selected_metric), False)
				end
			end
		end

	on_unit_selection_change is
			-- Action to be performed when selection in `unit_combo' changes
		local
			l_unit: QL_METRIC_UNIT
		do
			metric_definer.set_mode (metric_definer.new_mode)
			l_unit ?= unit_combo.selected_item.data
			check l_unit /= Void end
			metric_definer.set_unit (l_unit)
			metric_definer.load_metric (Void, False)
		end

	on_quick_metric_button_pressed is
			-- Action to be performed when "Quick metric" button is pressed
		do
			if quick_metric_btn.is_selected then
				if not is_quick_metric_initialized then
					check unit_combo.retrieve_item_by_data (class_unit, False) /= Void end
					unit_combo.retrieve_item_by_data (class_unit, False).enable_select
					on_unit_selection_change
					is_quick_metric_initialized := True
				end
				on_metric_selected (quick_metric (Void, False))
				metric_definition_area.show
				metric_selection_area.hide
			else
				metric_selector.try_to_selected_last_metric
				if metric_selector.last_selected_metric /= Void then
					on_metric_selected (metric_manager.metric_with_name (metric_selector.last_selected_metric))
				end
				metric_definition_area.hide
				metric_selection_area.show
			end
		end

	on_definition_change (a_criterion: EB_METRIC_CRITERION) is
			-- Action to be performed when definition in `metric_definer' change.
		do
			on_metric_selected (quick_metric (a_criterion, True))
			metric_definer.resize_criterion_grid_column (1, 0)
			metric_definer.resize_criterion_grid_column (2, 0)
		end

	on_domain_change (a_domain: EB_METRIC_DOMAIN) is
			-- Action to be performed when domain in `domain_selector' changes
		do
			display_metric
		end

	on_reload_metrics is
			-- Action to be performed when reload metrics
		do
			metric_tool.load_metrics (True)
		end

	on_open_user_defined_metric_file (a_x, a_y, a_button: INTEGER; a_x_tilt, a_y_tilt, a_pressure: DOUBLE; a_screen_x, a_screen_y: INTEGER) is
			-- Action to be performed to open user defined metric file in specified external editor
		local
			l_cmd_exec: COMMAND_EXECUTOR
			l_cmd_string: STRING
		do
			if a_button = 3 and then metric_manager.is_userdefined_metric_file_exist then
				l_cmd_string := preferences.misc_data.external_editor_command.twin
				if not l_cmd_string.is_empty then
					l_cmd_string.replace_substring_all ("$target", metric_manager.userdefined_metrics_file)
					l_cmd_string.replace_substring_all ("$line", "0")
					create l_cmd_exec
					l_cmd_exec.execute (l_cmd_string)
				end
			end
		end

feature {NONE} -- Implementation

	quick_metric (a_criterion: EB_METRIC_CRITERION; a_appliable: BOOLEAN): like current_metric is
			-- Metric defined in quick metric panel
			-- If `a_appliable' is True, use `a_criterion' as default criterion for the metric,
			-- otherwise, read criterion directly from `metric_definer'.
		local
			l_metric: EB_METRIC_BASIC
			l_unit: QL_METRIC_UNIT
		do
			l_unit ?= unit_combo.selected_item.data
			create l_metric.make (metric_manager.next_metric_name ("Unnamed metric"), l_unit)
			if a_appliable then
				l_metric.set_criteria (a_criterion)
			else
				l_metric.set_criteria (metric_definer.criterion)
			end
			Result := l_metric
		ensure
			result_attached: Result /= Void
		end

	domain_selector: EB_METRIC_DOMAIN_SELECTOR
			-- Domain selector

	metric_selector: EB_METRIC_SELECTOR
			-- Metric selecotr

	metric_definer: EB_BASIC_METRIC_DEFINITION_AREA
			-- Basic metric definition area

	setup_evaluation_environment (a_start: BOOLEAN) is
			-- Setup metric evaluation environment.
			-- If `a_start' is True, setup before metric evaluation, otherwise, setup after metric evaluation.
		local
			l_generator: like domain_generator_internal
		do
			l_generator := domain_generator_internal
			if a_start then
				l_generator.set_interval (20)
				l_generator.tick_actions.wipe_out
				l_generator.tick_actions.extend (agent on_stop_metric_evaluation)
				l_generator.tick_actions.extend (agent on_process_gui)
			else
				l_generator.tick_actions.wipe_out
				l_generator.set_interval (2000)
			end
		end

feature -- Metric management

	display_metric is
			-- Display information of `a_metric' in panel.
		local
			l_is_valid: BOOLEAN
			l_metric: like current_metric
		do
			l_metric := current_metric
			if l_metric /= Void then
				if is_using_quick_metric then
					metric_vadility_checker.process_metric (l_metric)
					l_is_valid := not metric_vadility_checker.has_error
				else
					l_is_valid := metric_manager.is_metric_valid (l_metric.name)
				end
				l_is_valid := l_is_valid and domain_selector.domain.is_valid
				if l_is_valid then
					run_metric_btn.enable_sensitive
					if l_metric.is_result_domain_available then
						run_with_detail_metric_btn.enable_sensitive
					else
						run_with_detail_metric_btn.disable_sensitive
					end
				else
					run_metric_btn.disable_sensitive
					run_with_detail_metric_btn.disable_sensitive
				end
				go_to_definition_btn.enable_sensitive
			else
				run_metric_btn.disable_sensitive
				run_with_detail_metric_btn.disable_sensitive
				go_to_definition_btn.disable_sensitive
			end
		end

feature{NONE} -- Implementation

	initialize_unit is
			-- Initialize `unit_combo'.
		local
			l_list_item: EV_LIST_ITEM
			l_unit_list: LIST [TUPLE [unit: QL_METRIC_UNIT; pixmap: EV_PIXMAP]]
		do
			l_unit_list := unit_list (False)
			from
				l_unit_list.start
			until
				l_unit_list.after
			loop
				create l_list_item.make_with_text (displayed_name (l_unit_list.item.unit.name))
				l_list_item.set_data (l_unit_list.item.unit)
				l_list_item.set_pixmap (l_unit_list.item.pixmap)
				unit_combo.extend (l_list_item)
				l_unit_list.forth
			end
			unit_combo.select_actions.extend (agent on_unit_selection_change)
		end

	domain_generator_internal: QL_DOMAIN_GENERATOR
			-- Domain generator used to setup metric evaluation

	stop_metric_evaluation (a_msg: STRING) is
			-- Stop metric evaluation.
			-- `a_msg' contains reason for the stoppage.
		require
			a_msg_attached: a_msg /= Void
		local
			l_domain_generator: like domain_generator_internal
		do
			domain_generator_internal.error_handler.insert_interrupt_error (a_msg)
			is_metric_running := False
			is_cancel_evaluation_requested := False
		rescue
			l_domain_generator := domain_generator_internal
			if l_domain_generator.error_handler.has_error then
				display_status_message (l_domain_generator.error_handler.error_list.last.out)
			end
		end

	display_status is
			-- Display status.
		local
			l_domain_generator: QL_DOMAIN_GENERATOR
		do
			l_domain_generator := domain_generator_internal
			if l_domain_generator.error_handler.has_error then
				display_status_message (l_domain_generator.error_handler.error_list.last.out)
			else
				display_status_message (tag_name)
			end
		end

feature{NONE} -- Notification

	update (a_observable: QL_OBSERVABLE; a_data: ANY) is
			-- Notification from `a_observable' indicating that `a_data' changed.
			-- In case that `a_data' is a BOOLEAN object, it is True indicates Eiffel compilation starts,
			-- otherwise indicates Eiffel compilation stops.
		local
			l_data: BOOLEAN_REF
		do
				-- Synchronize metric selector.
			metric_selector.load_metrics (True)
			metric_selector.try_to_selected_last_metric
			if metric_selector.last_selected_metric = Void then
				metric_selector.select_first_metric
			end
			if is_using_quick_metric then
				on_metric_selected (quick_metric (Void, False))
			else
				current_metric := metric_selector.selected_metric
			end
				-- Synchronize domain selector.
			domain_selector.refresh
			if a_data /= Void then
				l_data ?= a_data
				check l_data /= Void end
				if l_data.item then
					synchronize_when_compile_start
						-- This is an update when Eiffel compilation starts.
						-- Terminate metric evaluation.					
					if is_metric_running then
						is_stopped_by_eiffel_compilation := True
						on_stop_metric_evaluation_button_pressed
					end
				else
						-- This is an update when Eiffel compilation stops.
					synchronize_when_compile_stop
				end
			end
		end

invariant
	metric_tool_attached: metric_tool /= Void
	domain_generator_internal_attached: domain_generator_internal /= Void

indexing
        copyright:	"Copyright (c) 1984-2006, Eiffel Software"
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
                        distributed in the hope that it will be useful,	but
                        WITHOUT ANY WARRANTY; without even the implied warranty
                        of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
                        See the	GNU General Public License for more details.
                        
                        You should have received a copy of the GNU General Public
                        License along with Eiffel Software's Eiffel Development
                        Environment; if not, write to the Free Software Foundation,
                        Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA
                ]"
        source: "[
                         Eiffel Software
                         356 Storke Road, Goleta, CA 93117 USA
                         Telephone 805-685-1006, Fax 805-685-6869
                         Website http://www.eiffel.com
                         Customer support http://support.eiffel.com
                ]"


end -- class EB_METRIC_EVALUATION_PANEL

