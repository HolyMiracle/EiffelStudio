note

	description:

		"Xace option clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2014, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_OPTIONS

inherit

	ET_SHARED_XACE_OPTION_NAMES

	UC_SHARED_STRING_EQUALITY_TESTER

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new option clause.
		do
			declared_fst_expansion_factor := -1
			declared_heap_size := -1
			declared_inlining_size := -1
			declared_msil_classes_per_module := -1
			declared_stack_size := -1
		end

feature -- Status report

	is_abstract_declared: BOOLEAN
			-- Has 'abstract' option been declared?
		do
			Result := attached declared_abstract as l_declared_abstract and then not l_declared_abstract.is_undefined
		ensure
			definition: Result = (attached declared_abstract as l_declared_abstract and then not l_declared_abstract.is_undefined)
		end

	is_address_expression_declared: BOOLEAN
			-- Has 'address_expression' option been declared?
		do
			Result := attached declared_address_expression as l_declared_address_expression and then not l_declared_address_expression.is_undefined
		ensure
			definition: Result = (attached declared_address_expression as l_declared_address_expression and then not l_declared_address_expression.is_undefined)
		end

	is_arguments_declared: BOOLEAN
			-- Has 'arguments' option been declared?
		do
			Result := attached declared_arguments as l_declared_arguments and then not l_declared_arguments.is_empty
		ensure
			definition: Result = (attached declared_arguments as l_declared_arguments and then not l_declared_arguments.is_empty)
		end

	is_array_optimization_declared: BOOLEAN
			-- Has 'array_optimization' option been declared?
		do
			Result := attached declared_array_optimization as l_declared_array_optimization and then not l_declared_array_optimization.is_undefined
		ensure
			definition: Result = (attached declared_array_optimization as l_declared_array_optimization and then not l_declared_array_optimization.is_undefined)
		end

	is_assembly_declared: BOOLEAN
			-- Has 'assembly' option been declared?
		do
			Result := declared_assembly /= Void
		ensure
			definition: Result = (declared_assembly /= Void)
		end

	is_assertion_declared: BOOLEAN
			-- Has 'assertion' option been declared?
		do
			Result := attached declared_assertion as l_declared_assertion and then not l_declared_assertion.is_empty
		ensure
			definition: Result = (attached declared_assertion as l_declared_assertion and then not l_declared_assertion.is_empty)
		end

	is_attached_by_default_declared: BOOLEAN
			-- Has 'assertion' option been declared?
		do
			Result := attached declared_attached_by_default as l_declared_attached_by_default and then not l_declared_attached_by_default.is_undefined
		ensure
			definition: Result = (attached declared_attached_by_default as l_declared_attached_by_default and then not l_declared_attached_by_default.is_undefined)
		end

	is_automatic_backup_declared: BOOLEAN
			-- Has 'automatic_backup' option been declared?
		do
			Result := attached declared_automatic_backup as l_declared_automatic_backup and then not l_declared_automatic_backup.is_undefined
		ensure
			definition: Result = (attached declared_automatic_backup as l_declared_automatic_backup and then not l_declared_automatic_backup.is_undefined)
		end

	is_callback_declared: BOOLEAN
			-- Has 'callback' option been declared?
		do
			Result := declared_callback /= Void
		ensure
			definition: Result = (declared_callback /= Void)
		end

	is_case_insensitive_declared: BOOLEAN
			-- Has 'case_insensitive' option been declared?
		do
			Result := attached declared_case_insensitive as l_declared_case_insensitive and then not l_declared_case_insensitive.is_undefined
		ensure
			definition: Result = (attached declared_case_insensitive as l_declared_case_insensitive and then not l_declared_case_insensitive.is_undefined)
		end

	is_check_generic_creation_constraint_declared: BOOLEAN
			-- Has 'check_generic_creation_constraint' option been declared?
		do
			Result := attached declared_check_generic_creation_constraint as l_declared_check_generic_creation_constraint and then not l_declared_check_generic_creation_constraint.is_undefined
		ensure
			definition: Result = (attached declared_check_generic_creation_constraint as l_declared_check_generic_creation_constraint and then not l_declared_check_generic_creation_constraint.is_undefined)
		end

	is_check_vape_declared: BOOLEAN
			-- Has 'check_vape' option been declared?
		do
			Result := attached declared_check_vape as l_declared_check_vape and then not l_declared_check_vape.is_undefined
		ensure
			definition: Result = (attached declared_check_vape as l_declared_check_vape and then not l_declared_check_vape.is_undefined)
		end

	is_clean_declared: BOOLEAN
			-- Has 'clean' option been declared?
		do
			Result := attached declared_clean as l_declared_clean and then not l_declared_clean.is_undefined
		ensure
			definition: Result = (attached declared_clean as l_declared_clean and then not l_declared_clean.is_undefined)
		end

	is_cls_compliant_declared: BOOLEAN
			-- Has 'cls_compliant' option been declared?
		do
			Result := attached declared_cls_compliant as l_declared_cls_compliant and then not l_declared_cls_compliant.is_undefined
		ensure
			definition: Result = (attached declared_cls_compliant as l_declared_cls_compliant and then not l_declared_cls_compliant.is_undefined)
		end

	is_component_declared: BOOLEAN
			-- Has 'component' option been declared?
		do
			Result := declared_component /= Void
		ensure
			definition: Result = (declared_component /= Void)
		end

	is_console_application_declared: BOOLEAN
			-- Has 'console_application' option been declared?
		do
			Result := attached declared_console_application as l_declared_console_application and then not l_declared_console_application.is_undefined
		ensure
			definition: Result = (attached declared_console_application as l_declared_console_application and then not l_declared_console_application.is_undefined)
		end

	is_create_keyword_extension_declared: BOOLEAN
			-- Has 'create_keyword_extension' option been declared?
		do
			Result := attached declared_create_keyword_extension as l_declared_create_keyword_extension and then not l_declared_create_keyword_extension.is_undefined
		ensure
			definition: Result = (attached declared_create_keyword_extension as l_declared_create_keyword_extension and then not l_declared_create_keyword_extension.is_undefined)
		end

	is_culture_declared: BOOLEAN
			-- Has 'culture' option been declared?
		do
			Result := declared_culture /= Void
		ensure
			definition: Result = (declared_culture /= Void)
		end

	is_c_compiler_options_declared: BOOLEAN
			-- Has 'c_compiler_options' option been declared?
		do
			Result := attached declared_c_compiler_options as l_declared_c_compiler_options and then not l_declared_c_compiler_options.is_empty
		ensure
			definition: Result = (attached declared_c_compiler_options as l_declared_c_compiler_options and then not l_declared_c_compiler_options.is_empty)
		end

	is_dead_code_removal_declared: BOOLEAN
			-- Has 'dead_code_removal' option been declared?
		do
			Result := attached declared_dead_code_removal as l_declared_dead_code_removal and then not l_declared_dead_code_removal.is_empty
		ensure
			definition: Result = (attached declared_dead_code_removal as l_declared_dead_code_removal and then not l_declared_dead_code_removal.is_empty)
		end

	is_debug_option_declared: BOOLEAN
			-- Has 'debug' option been declared?
		do
			Result := attached declared_debug_option as l_declared_debug_option and then not l_declared_debug_option.is_undefined
		ensure
			definition: Result = (attached declared_debug_option as l_declared_debug_option and then not l_declared_debug_option.is_undefined)
		end

	is_debug_tag_declared: BOOLEAN
			-- Has 'debug_tag' option been declared?
		do
			Result := attached declared_debug_tag as l_declared_debug_tag and then not l_declared_debug_tag.is_empty
		ensure
			definition: Result = (attached declared_debug_tag as l_declared_debug_tag and then not l_declared_debug_tag.is_empty)
		end

	is_debugger_declared: BOOLEAN
			-- Has 'debugger' option been declared?
		do
			Result := attached declared_debugger as l_declared_debugger and then not l_declared_debugger.is_undefined
		ensure
			definition: Result = (attached declared_debugger as l_declared_debugger and then not l_declared_debugger.is_undefined)
		end

	is_document_declared: BOOLEAN
			-- Has 'document' option been declared?
		do
			Result := declared_document /= Void
		ensure
			definition: Result = (declared_document /= Void)
		end

	is_dotnet_naming_convention_declared: BOOLEAN
			-- Has 'dotnet_naming_convention' option been declared?
		do
			Result := attached declared_dotnet_naming_convention as l_declared_dotnet_naming_convention and then not l_declared_dotnet_naming_convention.is_undefined
		ensure
			definition: Result = (attached declared_dotnet_naming_convention as l_declared_dotnet_naming_convention and then not l_declared_dotnet_naming_convention.is_undefined)
		end

	is_dynamic_runtime_declared: BOOLEAN
			-- Has 'dynamic_runtime' option been declared?
		do
			Result := attached declared_dynamic_runtime as l_declared_dynamic_runtime and then not l_declared_dynamic_runtime.is_undefined
		ensure
			definition: Result = (attached declared_dynamic_runtime as l_declared_dynamic_runtime and then not l_declared_dynamic_runtime.is_undefined)
		end

	is_ecf_library_declared: BOOLEAN
			-- Has 'ecf_library' option been declared?
		do
			Result := declared_ecf_library /= Void
		ensure
			definition: Result = (declared_ecf_library /= Void)
		end

	is_enforce_unique_class_names_declared: BOOLEAN
			-- Has 'enforce_unique_class_names' option been declared?
		do
			Result := attached declared_enforce_unique_class_names as l_declared_enforce_unique_class_names and then not l_declared_enforce_unique_class_names.is_undefined
		ensure
			definition: Result = (attached declared_enforce_unique_class_names as l_declared_enforce_unique_class_names and then not l_declared_enforce_unique_class_names.is_undefined)
		end

	is_exception_trace_declared: BOOLEAN
			-- Has 'exception_trace' option been declared?
		do
			Result := attached declared_exception_trace as l_declared_exception_trace and then not l_declared_exception_trace.is_undefined
		ensure
			definition: Result = (attached declared_exception_trace as l_declared_exception_trace and then not l_declared_exception_trace.is_undefined)
		end

	is_exclude_declared: BOOLEAN
			-- Has 'exclude' option been declared?
		do
			Result := attached declared_exclude as l_declared_exclude and then not l_declared_exclude.is_empty
		ensure
			definition: Result = (attached declared_exclude as l_declared_exclude and then not l_declared_exclude.is_empty)
		end

	is_export_option_declared: BOOLEAN
			-- Has 'export' option been declared?
		do
			Result := declared_export_option /= Void
		ensure
			definition: Result = (declared_export_option /= Void)
		end

	is_external_runtime_declared: BOOLEAN
			-- Has 'external_runtime' option been declared?
		do
			Result := declared_external_runtime /= Void
		ensure
			definition: Result = (declared_external_runtime /= Void)
		end

	is_finalize_option_declared: BOOLEAN
			-- Has 'finalize' option been declared?
		do
			Result := attached declared_finalize_option as l_declared_finalize_option and then not l_declared_finalize_option.is_undefined
		ensure
			definition: Result = (attached declared_finalize_option as l_declared_finalize_option and then not l_declared_finalize_option.is_undefined)
		end

	is_flat_fst_optimization_declared: BOOLEAN
			-- Has 'flat_fst_optimization' option been declared?
		do
			Result := attached declared_flat_fst_optimization as l_declared_flat_fst_optimization and then not l_declared_flat_fst_optimization.is_undefined
		ensure
			definition: Result = (attached declared_flat_fst_optimization as l_declared_flat_fst_optimization and then not l_declared_flat_fst_optimization.is_undefined)
		end

	is_force_32bits_declared: BOOLEAN
			-- Has 'force_32bits' option been declared?
		do
			Result := attached declared_force_32bits as l_declared_force_32bits and then not l_declared_force_32bits.is_undefined
		ensure
			definition: Result = (attached declared_force_32bits as l_declared_force_32bits and then not l_declared_force_32bits.is_undefined)
		end

	is_fst_expansion_factor_declared: BOOLEAN
			-- Has 'fst_expansion_factor' option been declared?
		do
			Result := declared_fst_expansion_factor >= 0
		ensure
			definition: Result = (declared_fst_expansion_factor >= 0)
		end

	is_fst_optimization_declared: BOOLEAN
			-- Has 'fst_optimization' option been declared?
		do
			Result := attached declared_fst_optimization as l_declared_fst_optimization and then not l_declared_fst_optimization.is_undefined
		ensure
			definition: Result = (attached declared_fst_optimization as l_declared_fst_optimization and then not l_declared_fst_optimization.is_undefined)
		end

	is_full_class_checking_declared: BOOLEAN
			-- Has 'full_class_checking' option been declared?
		do
			Result := attached declared_full_class_checking as l_declared_full_class_checking and then not l_declared_full_class_checking.is_undefined
		ensure
			definition: Result = (attached declared_full_class_checking as l_declared_full_class_checking and then not l_declared_full_class_checking.is_undefined)
		end

	is_garbage_collector_declared: BOOLEAN
			-- Has 'garbage_collector' option been declared?
		do
			Result := declared_garbage_collector /= Void
		ensure
			definition: Result = (declared_garbage_collector /= Void)
		end

	is_gc_info_declared: BOOLEAN
			-- Has 'gc_info' option been declared?
		do
			Result := attached declared_gc_info as l_declared_gc_info and then not l_declared_gc_info.is_undefined
		ensure
			definition: Result = (attached declared_gc_info as l_declared_gc_info and then not l_declared_gc_info.is_undefined)
		end

	is_heap_size_declared: BOOLEAN
			-- Has 'heap_size' option been declared?
		do
			Result := declared_heap_size >= 0
		ensure
			definition: Result = (declared_heap_size >= 0)
		end

	is_header_declared: BOOLEAN
			-- Has 'header' option been declared?
		do
			Result := attached declared_header as l_declared_header and then not l_declared_header.is_empty
		ensure
			definition: Result = (attached declared_header as l_declared_header and then not l_declared_header.is_empty)
		end

	is_high_memory_compiler_declared: BOOLEAN
			-- Has 'high_memory_compiler' option been declared?
		do
			Result := attached declared_high_memory_compiler as l_declared_high_memory_compiler and then not l_declared_high_memory_compiler.is_undefined
		ensure
			definition: Result = (attached declared_high_memory_compiler as l_declared_high_memory_compiler and then not l_declared_high_memory_compiler.is_undefined)
		end

	is_il_verifiable_declared: BOOLEAN
			-- Has 'il_verifiable' option been declared?
		do
			Result := attached declared_il_verifiable as l_declared_il_verifiable and then not l_declared_il_verifiable.is_undefined
		ensure
			definition: Result = (attached declared_il_verifiable as l_declared_il_verifiable and then not l_declared_il_verifiable.is_undefined)
		end

	is_include_declared: BOOLEAN
			-- Has 'include' option been declared?
		do
			Result := attached declared_include as l_declared_include and then not l_declared_include.is_empty
		ensure
			definition: Result = (attached declared_include as l_declared_include and then not l_declared_include.is_empty)
		end

	is_inlining_declared: BOOLEAN
			-- Has 'inlining' option been declared?
		do
			Result := attached declared_inlining as l_declared_inlining and then not l_declared_inlining.is_empty
		ensure
			definition: Result = (attached declared_inlining as l_declared_inlining and then not l_declared_inlining.is_empty)
		end

	is_inlining_size_declared: BOOLEAN
			-- Has 'inlining_size' option been declared?
		do
			Result := declared_inlining_size >= 0
		ensure
			definition: Result = (declared_inlining_size >= 0)
		end

	is_jumps_optimization_declared: BOOLEAN
			-- Has 'jumps_optimization' option been declared?
		do
			Result := attached declared_jumps_optimization as l_declared_jumps_optimization and then not l_declared_jumps_optimization.is_undefined
		ensure
			definition: Result = (attached declared_jumps_optimization as l_declared_jumps_optimization and then not l_declared_jumps_optimization.is_undefined)
		end

	is_layout_declared: BOOLEAN
			-- Has 'layout' option been declared?
		do
			Result := attached declared_layout as l_declared_layout and then not l_declared_layout.is_empty
		ensure
			definition: Result = (attached declared_layout as l_declared_layout and then not l_declared_layout.is_empty)
		end

	is_layout_optimization_declared: BOOLEAN
			-- Has 'layout_optimization' option been declared?
		do
			Result := attached declared_layout_optimization as l_declared_layout_optimization and then not l_declared_layout_optimization.is_undefined
		ensure
			definition: Result = (attached declared_layout_optimization as l_declared_layout_optimization and then not l_declared_layout_optimization.is_undefined)
		end

	is_leaves_optimization_declared: BOOLEAN
			-- Has 'leaves_optimization' option been declared?
		do
			Result := attached declared_leaves_optimization as l_declared_leaves_optimization and then not l_declared_leaves_optimization.is_undefined
		ensure
			definition: Result = (attached declared_leaves_optimization as l_declared_leaves_optimization and then not l_declared_leaves_optimization.is_undefined)
		end

	is_line_generation_declared: BOOLEAN
			-- Has 'line_generation' option been declared?
		do
			Result := attached declared_line_generation as l_declared_line_generation and then not l_declared_line_generation.is_undefined
		ensure
			definition: Result = (attached declared_line_generation as l_declared_line_generation and then not l_declared_line_generation.is_undefined)
		end

	is_link_declared: BOOLEAN
			-- Has 'link' option been declared?
		do
			Result := attached declared_link as l_declared_link and then not l_declared_link.is_empty
		ensure
			definition: Result = (attached declared_link as l_declared_link and then not l_declared_link.is_empty)
		end

	is_linker_declared: BOOLEAN
			-- Has 'linker' option been declared?
		do
			Result := declared_linker /= Void
		ensure
			definition: Result = (declared_linker /= Void)
		end

	is_linux_fpu_double_precision_declared: BOOLEAN
			-- Has 'linux_fpu_double_precision' option been declared?
		do
			Result := attached declared_linux_fpu_double_precision as l_declared_linux_fpu_double_precision and then not l_declared_linux_fpu_double_precision.is_undefined
		ensure
			definition: Result = (attached declared_linux_fpu_double_precision as l_declared_linux_fpu_double_precision and then not l_declared_linux_fpu_double_precision.is_undefined)
		end

	is_manifest_string_trace_declared: BOOLEAN
			-- Has 'manifest_string_trace' option been declared?
		do
			Result := attached declared_manifest_string_trace as l_declared_manifest_string_trace and then not l_declared_manifest_string_trace.is_undefined
		ensure
			definition: Result = (attached declared_manifest_string_trace as l_declared_manifest_string_trace and then not l_declared_manifest_string_trace.is_undefined)
		end

	is_map_declared: BOOLEAN
			-- Has 'map' option been declared?
		do
			Result := attached declared_map as l_declared_map and then not l_declared_map.is_undefined
		ensure
			definition: Result = (attached declared_map as l_declared_map and then not l_declared_map.is_undefined)
		end

	is_metadata_cache_path_declared: BOOLEAN
			-- Has 'metadata_cache_path' option been declared?
		do
			Result := declared_metadata_cache_path /= Void
		ensure
			definition: Result = (declared_metadata_cache_path /= Void)
		end

	is_msil_assembly_compatibility_declared: BOOLEAN
			-- Has 'msil_assembly_compatibility' option been declared?
		do
			Result := declared_msil_assembly_compatibility /= Void
		ensure
			definition: Result = (declared_msil_assembly_compatibility /= Void)
		end

	is_msil_classes_per_module_declared: BOOLEAN
			-- Has 'msil_classes_per_module' option been declared?
		do
			Result := declared_msil_classes_per_module > 0
		ensure
			definition: Result = (declared_msil_classes_per_module > 0)
		end

	is_msil_clr_version_declared: BOOLEAN
			-- Has 'msil_clr_version' option been declared?
		do
			Result := declared_msil_clr_version /= Void
		ensure
			definition: Result = (declared_msil_clr_version /= Void)
		end

	is_msil_culture_declared: BOOLEAN
			-- Has 'msil_culture' option been declared?
		do
			Result := declared_msil_culture /= Void
		ensure
			definition: Result = (declared_msil_culture /= Void)
		end

	is_msil_generation_declared: BOOLEAN
			-- Has 'msil_generation' option been declared?
		do
			Result := attached declared_msil_generation as l_declared_msil_generation and then not l_declared_msil_generation.is_undefined
		ensure
			definition: Result = (attached declared_msil_generation as l_declared_msil_generation and then not l_declared_msil_generation.is_undefined)
		end

	is_msil_generation_version_declared: BOOLEAN
			-- Has 'msil_generation_version' option been declared?
		do
			Result := declared_msil_generation_version /= Void
		ensure
			definition: Result = (declared_msil_generation_version /= Void)
		end

	is_msil_key_file_name_declared: BOOLEAN
			-- Has 'msil_key_file_name' option been declared?
		do
			Result := declared_msil_key_file_name /= Void
		ensure
			definition: Result = (declared_msil_key_file_name /= Void)
		end

	is_msil_use_optimized_precompile_declared: BOOLEAN
			-- Has 'msil_use_optimized_precompile' option been declared?
		do
			Result := attached declared_msil_use_optimized_precompile as l_declared_msil_use_optimized_precompile and then not l_declared_msil_use_optimized_precompile.is_undefined
		ensure
			definition: Result = (attached declared_msil_use_optimized_precompile as l_declared_msil_use_optimized_precompile and then not l_declared_msil_use_optimized_precompile.is_undefined)
		end

	is_multithreaded_declared: BOOLEAN
			-- Has 'multithreaded' option been declared?
		do
			Result := attached declared_multithreaded as l_declared_multithreaded and then not l_declared_multithreaded.is_undefined
		ensure
			definition: Result = (attached declared_multithreaded as l_declared_multithreaded and then not l_declared_multithreaded.is_undefined)
		end

	is_namespace_declared: BOOLEAN
			-- Has 'namespace' option been declared?
		do
			Result := declared_namespace /= Void
		ensure
			definition: Result = (declared_namespace /= Void)
		end

	is_no_default_lib_declared: BOOLEAN
			-- Has 'no_default_lib' option been declared?
		do
			Result := attached declared_no_default_lib as l_declared_no_default_lib and then not l_declared_no_default_lib.is_undefined
		ensure
			definition: Result = (attached declared_no_default_lib as l_declared_no_default_lib and then not l_declared_no_default_lib.is_undefined)
		end

	is_old_verbatim_strings_declared: BOOLEAN
			-- Has 'old_verbatim_strings' option been declared?
		do
			Result := attached declared_old_verbatim_strings as l_declared_old_verbatim_strings and then not l_declared_old_verbatim_strings.is_undefined
		ensure
			definition: Result = (attached declared_old_verbatim_strings as l_declared_old_verbatim_strings and then not l_declared_old_verbatim_strings.is_undefined)
		end

	is_override_cluster_declared: BOOLEAN
			-- Has 'override_cluster' option been declared?
		do
			Result := attached declared_override_cluster as l_declared_override_cluster and then not l_declared_override_cluster.is_empty
		ensure
			definition: Result = (attached declared_override_cluster as l_declared_override_cluster and then not l_declared_override_cluster.is_empty)
		end

	is_portable_code_generation_declared: BOOLEAN
			-- Has 'portable_code_generation' option been declared?
		do
			Result := attached declared_portable_code_generation as l_declared_portable_code_generation and then not l_declared_portable_code_generation.is_undefined
		ensure
			definition: Result = (attached declared_portable_code_generation as l_declared_portable_code_generation and then not l_declared_portable_code_generation.is_undefined)
		end

	is_precompiled_declared: BOOLEAN
			-- Has 'precompiled' option been declared?
		do
			Result := declared_precompiled /= Void
		ensure
			definition: Result = (declared_precompiled /= Void)
		end

	is_prefix_option_declared: BOOLEAN
			-- Has 'prefix' option been declared?
		do
			Result := declared_prefix_option /= Void
		ensure
			definition: Result = (declared_prefix_option /= Void)
		end

	is_profile_declared: BOOLEAN
			-- Has 'profile' option been declared?
		do
			Result := attached declared_profile as l_declared_profile and then not l_declared_profile.is_undefined
		ensure
			definition: Result = (attached declared_profile as l_declared_profile and then not l_declared_profile.is_undefined)
		end

	is_public_key_token_declared: BOOLEAN
			-- Has 'public_key_token' option been declared?
		do
			Result := declared_public_key_token /= Void
		ensure
			definition: Result = (declared_public_key_token /= Void)
		end

	is_reloads_optimization_declared: BOOLEAN
			-- Has 'reloads_optimization' option been declared?
		do
			Result := attached declared_reloads_optimization as l_declared_reloads_optimization and then not l_declared_reloads_optimization.is_undefined
		ensure
			definition: Result = (attached declared_reloads_optimization as l_declared_reloads_optimization and then not l_declared_reloads_optimization.is_undefined)
		end

	is_read_only_declared: BOOLEAN
			-- Has 'read_only' option been declared?
		do
			Result := attached declared_read_only as l_declared_read_only and then not l_declared_read_only.is_undefined
		ensure
			definition: Result = (attached declared_read_only as l_declared_read_only and then not l_declared_read_only.is_undefined)
		end

	is_recursive_declared: BOOLEAN
			-- Has 'recursive' option been declared?
		do
			Result := attached declared_recursive as l_declared_recursive and then not l_declared_recursive.is_undefined
		ensure
			definition: Result = (attached declared_recursive as l_declared_recursive and then not l_declared_recursive.is_undefined)
		end

	is_shared_library_definition_declared: BOOLEAN
			-- Has 'shared_library_definition' option been declared?
		do
			Result := declared_shared_library_definition /= Void
		ensure
			definition: Result = (declared_shared_library_definition /= Void)
		end

	is_split_declared: BOOLEAN
			-- Has 'split' option been declared?
		do
			Result := attached declared_split as l_declared_split and then not l_declared_split.is_undefined
		ensure
			definition: Result = (attached declared_split as l_declared_split and then not l_declared_split.is_undefined)
		end

	is_stack_size_declared: BOOLEAN
			-- Has 'stack_size' option been declared?
		do
			Result := declared_stack_size >= 0
		ensure
			definition: Result = (declared_stack_size >= 0)
		end

	is_storable_declared: BOOLEAN
			-- Has 'storable' option been declared?
		do
			Result := attached declared_storable as l_declared_storable and then not l_declared_storable.is_undefined
		ensure
			definition: Result = (attached declared_storable as l_declared_storable and then not l_declared_storable.is_undefined)
		end

	is_storable_filename_declared: BOOLEAN
			-- Has 'storable_filename' option been declared?
		do
			Result := declared_storable_filename /= Void
		ensure
			definition: Result = (declared_storable_filename /= Void)
		end

	is_strip_option_declared: BOOLEAN
			-- Has 'strip' option been declared?
		do
			Result := attached declared_strip_option as l_declared_strip_option and then not l_declared_strip_option.is_undefined
		ensure
			definition: Result = (attached declared_strip_option as l_declared_strip_option and then not l_declared_strip_option.is_undefined)
		end

	is_syntax_declared: BOOLEAN
			-- Has 'syntax' option been declared?
		do
			Result := declared_syntax /= Void
		ensure
			definition: Result = (declared_syntax /= Void)
		end

	is_target_declared: BOOLEAN
			-- Has 'target' option been declared?
		do
			Result := declared_target /= Void
		ensure
			definition: Result = (declared_target /= Void)
		end

	is_trace_declared: BOOLEAN
			-- Has 'trace' option been declared?
		do
			Result := attached declared_trace as l_declared_trace and then not l_declared_trace.is_undefined
		ensure
			definition: Result = (attached declared_trace as l_declared_trace and then not l_declared_trace.is_undefined)
		end

	is_use_cluster_name_as_namespace_declared: BOOLEAN
			-- Has 'use_cluster_name_as_namespace' option been declared?
		do
			Result := attached declared_use_cluster_name_as_namespace as l_declared_use_cluster_name_as_namespace and then not l_declared_use_cluster_name_as_namespace.is_undefined
		ensure
			definition: Result = (attached declared_use_cluster_name_as_namespace as l_declared_use_cluster_name_as_namespace and then not l_declared_use_cluster_name_as_namespace.is_undefined)
		end

	is_use_full_cluster_name_as_namespace_declared: BOOLEAN
			-- Has 'use_full_cluster_name_as_namespace' option been declared?
		do
			Result := attached declared_use_full_cluster_name_as_namespace as l_declared_use_full_cluster_name_as_namespace and then not l_declared_use_full_cluster_name_as_namespace.is_undefined
		ensure
			definition: Result = (attached declared_use_full_cluster_name_as_namespace as l_declared_use_full_cluster_name_as_namespace and then not l_declared_use_full_cluster_name_as_namespace.is_undefined)
		end

	is_verbose_declared: BOOLEAN
			-- Has 'verbose' option been declared?
		do
			Result := attached declared_verbose as l_declared_verbose and then not l_declared_verbose.is_undefined
		ensure
			definition: Result = (attached declared_verbose as l_declared_verbose and then not l_declared_verbose.is_undefined)
		end

	is_version_declared: BOOLEAN
			-- Has 'version' option been declared?
		do
			Result := declared_version /= Void
		ensure
			definition: Result = (declared_version /= Void)
		end

	is_visible_filename_declared: BOOLEAN
			-- Has 'visible_filename' option been declared?
		do
			Result := declared_visible_filename /= Void
		ensure
			definition: Result = (declared_visible_filename /= Void)
		end

	is_void_safety_declared: BOOLEAN
			-- Has 'void_safety' option been declared?
		do
			Result := declared_void_safety /= Void
		ensure
			definition: Result = (declared_void_safety /= Void)
		end

	is_warning_declared: BOOLEAN
			-- Has 'warning' option been declared?
		do
			Result := declared_warning /= Void
		ensure
			definition: Result = (declared_warning /= Void)
		end

	is_wedit_declared: BOOLEAN
			-- Has 'wedit' option been declared?
		do
			Result := attached declared_wedit as l_declared_wedit and then not l_declared_wedit.is_undefined
		ensure
			definition: Result = (attached declared_wedit as l_declared_wedit and then not l_declared_wedit.is_undefined)
		end

feature -- Option values

	abstract: BOOLEAN
			-- 'abstract' option
		do
			if is_abstract_declared and then attached declared_abstract as l_declared_abstract then
				Result := l_declared_abstract.is_true
			else
				Result := default_abstract
			end
		end

	address_expression: BOOLEAN
			-- 'address_expression' option
		do
			if is_address_expression_declared and then attached declared_address_expression as l_declared_address_expression then
				Result := l_declared_address_expression.is_true
			else
				Result := default_address_expression
			end
		end

	array_optimization: BOOLEAN
			-- Is 'array_optimization' option enabled?
		do
			if is_array_optimization_declared and then attached declared_array_optimization as l_declared_array_optimization then
				Result := l_declared_array_optimization.is_true
			else
				Result := default_array_optimization
			end
		end

	arguments: DS_HASH_SET [STRING]
			-- 'arguments' option
		do
			if is_arguments_declared and then attached declared_arguments as l_declared_arguments then
				Result := l_declared_arguments
			else
				Result := default_arguments
			end
		ensure
			arguments_not_void: Result /= Void
			no_void_argument: not Result.has_void
		end

	assembly: detachable STRING
			-- Is 'assembly' option enabled?
		do
			if is_assembly_declared then
				Result := declared_assembly
			else
				Result := default_assembly
			end
		end

	assertion: DS_HASH_SET [STRING]
			-- 'assertion' option
		do
			if is_assertion_declared and then attached declared_assertion as l_declared_assertion then
				Result := l_declared_assertion
			else
				Result := default_assertion
			end
		ensure
			assertion_not_void: Result /= Void
			-- valid_value: forall v in Result, valid_assertion.has (v)
		end

	attached_by_default: BOOLEAN
			-- 'attached_by_default' option
		do
			if is_attached_by_default_declared and then attached declared_attached_by_default as l_declared_attached_by_default then
				Result := l_declared_attached_by_default.is_true
			else
				Result := default_attached_by_default
			end
		end

	automatic_backup: BOOLEAN
			-- Is 'automatic_backup' option enabled?
		do
			if is_automatic_backup_declared and then attached declared_automatic_backup as l_declared_automatic_backup then
				Result := l_declared_automatic_backup.is_true
			else
				Result := default_automatic_backup
			end
		end

	callback: detachable STRING
			-- 'callback' option
		do
			if is_callback_declared then
				Result := declared_callback
			else
				Result := default_callback
			end
		ensure
			valid_callback: Result /= Void implies valid_callback.has (Result)
		end

	case_insensitive: BOOLEAN
			-- 'case_insensitive' option
		do
			if is_case_insensitive_declared and then attached declared_case_insensitive as l_declared_case_insensitive then
				Result := l_declared_case_insensitive.is_true
			else
				Result := default_case_insensitive
			end
		end

	check_generic_creation_constraint: BOOLEAN
			-- 'check_generic_creation_constraint' option
		do
			if is_check_generic_creation_constraint_declared and then attached declared_check_generic_creation_constraint as l_declared_check_generic_creation_constraint then
				Result := l_declared_check_generic_creation_constraint.is_true
			else
				Result := default_check_generic_creation_constraint
			end
		end

	check_vape: BOOLEAN
			-- 'check_vape' option
		do
			if is_check_vape_declared and then attached declared_check_vape as l_declared_check_vape then
				Result := l_declared_check_vape.is_true
			else
				Result := default_check_vape
			end
		end

	clean: BOOLEAN
			-- 'clean' option
		do
			if is_clean_declared and then attached declared_clean as l_declared_clean then
				Result := l_declared_clean.is_true
			else
				Result := default_clean
			end
		end

	cls_compliant: BOOLEAN
			-- 'cls_compliant' option
		do
			if is_cls_compliant_declared and then attached declared_cls_compliant as l_declared_cls_compliant then
				Result := l_declared_cls_compliant.is_true
			else
				Result := default_cls_compliant
			end
		end

	component: detachable STRING
			-- 'component' option
		do
			if is_component_declared then
				Result := declared_component
			else
				Result := default_component
			end
		end

	console_application: BOOLEAN
			-- 'console_application' option
		do
			if is_console_application_declared and then attached declared_console_application as l_declared_console_application then
				Result := l_declared_console_application.is_true
			else
				Result := default_console_application
			end
		end

	create_keyword_extension: BOOLEAN
			-- 'create_keyword_extension' option
		do
			if is_create_keyword_extension_declared and then attached declared_create_keyword_extension as l_declared_create_keyword_extension then
				Result := l_declared_create_keyword_extension.is_true
			else
				Result := default_create_keyword_extension
			end
		end

	culture: STRING
			-- 'culture' option
		do
			if attached declared_culture as l_declared_culture then
				check is_culture_declared: is_culture_declared end
				Result := l_declared_culture
			else
				Result := default_culture
			end
		ensure
			culture_not_void: Result /= Void
		end

	c_compiler_options: DS_HASH_SET [STRING]
			-- 'c_compiler_options' option
		do
			if is_c_compiler_options_declared and then attached declared_c_compiler_options as l_declared_c_compiler_options then
				Result := l_declared_c_compiler_options
			else
				Result := default_c_compiler_options
			end
		ensure
			c_compiler_options_not_void: Result /= Void
			no_void_c_compiler_option: not Result.has_void
		end

	dead_code_removal: DS_HASH_SET [STRING]
			-- 'dead_code_removal' option
		do
			if is_dead_code_removal_declared and then attached declared_dead_code_removal as l_declared_dead_code_removal then
				Result := l_declared_dead_code_removal
			else
				Result := default_dead_code_removal
			end
		ensure
			dead_code_removal_not_void: Result /= Void
			-- valid_value: forall v in Result, valid_dead_code_removal.has (v)
		end

	debug_option: BOOLEAN
			-- 'debug' option
		do
			if is_debug_option_declared and then attached declared_debug_option as l_declared_debug_option then
				Result := l_declared_debug_option.is_true
			else
				Result := default_debug_option
			end
		end

	debug_tag: DS_HASH_SET [STRING]
			-- 'debug_tag' option
		do
			if is_debug_tag_declared and then attached declared_debug_tag as l_declared_debug_tag then
				Result := l_declared_debug_tag
			else
				Result := default_debug_tag
			end
		ensure
			debug_tag_not_void: Result /= Void
			no_void_debug_tag: not Result.has_void
		end

	debugger: BOOLEAN
			-- 'debugger' option
		do
			if is_debugger_declared and then attached declared_debugger as l_declared_debugger then
				Result := l_declared_debugger.is_true
			else
				Result := default_debugger
			end
		end

	document: detachable STRING
			-- 'document' option
		do
			if is_document_declared then
				Result := declared_document
			else
				Result := default_document
			end
		end

	dotnet_naming_convention: BOOLEAN
			-- 'dotnet_naming_convention' option
		do
			if is_dotnet_naming_convention_declared and then attached declared_dotnet_naming_convention as l_declared_dotnet_naming_convention then
				Result := l_declared_dotnet_naming_convention.is_true
			else
				Result := default_dotnet_naming_convention
			end
		end

	dynamic_runtime: BOOLEAN
			-- 'dynamic_runtime' option
		do
			if is_dynamic_runtime_declared and then attached declared_dynamic_runtime as l_declared_dynamic_runtime then
				Result := l_declared_dynamic_runtime.is_true
			else
				Result := default_dynamic_runtime
			end
		end

	ecf_library: detachable STRING
			-- 'ecf_library' option
		do
			if is_ecf_library_declared then
				Result := declared_ecf_library
			else
				Result := default_ecf_library
			end
		end

	enforce_unique_class_names: BOOLEAN
			-- 'enforce_unique_class_names' option
		do
			if is_enforce_unique_class_names_declared and then attached declared_enforce_unique_class_names as l_declared_enforce_unique_class_names then
				Result := l_declared_enforce_unique_class_names.is_true
			else
				Result := default_enforce_unique_class_names
			end
		end

	exception_trace: BOOLEAN
			-- 'exception_trace' option
		do
			if is_exception_trace_declared and then attached declared_exception_trace as l_declared_exception_trace then
				Result := l_declared_exception_trace.is_true
			else
				Result := default_exception_trace
			end
		end

	exclude: DS_HASH_SET [STRING]
			-- 'exclude' option
		do
			if is_exclude_declared and then attached declared_exclude as l_declared_exclude then
				Result := l_declared_exclude
			else
				Result := default_exclude
			end
		ensure
			exclude_not_void: Result /= Void
			no_void_exclude: not Result.has_void
		end

	export_option: detachable STRING
			-- 'export' option
		do
			if is_export_option_declared then
				Result := declared_export_option
			else
				Result := default_export_option
			end
		end

	external_runtime: detachable STRING
			-- 'external_runtime' option
		do
			if is_external_runtime_declared then
				Result := declared_external_runtime
			else
				Result := default_external_runtime
			end
		end

	finalize_option: BOOLEAN
			-- 'finalize' option
		do
			if is_finalize_option_declared and then attached declared_finalize_option as l_declared_finalize_option then
				Result := l_declared_finalize_option.is_true
			else
				Result := default_finalize_option
			end
		end

	flat_fst_optimization: BOOLEAN
			-- 'flat_fst_optimization' option
		do
			if is_flat_fst_optimization_declared and then attached declared_flat_fst_optimization as l_declared_flat_fst_optimization then
				Result := l_declared_flat_fst_optimization.is_true
			else
				Result := default_flat_fst_optimization
			end
		end

	force_32bits: BOOLEAN
			-- 'force_32bits' option
		do
			if is_force_32bits_declared and then attached declared_force_32bits as l_declared_force_32bits then
				Result := l_declared_force_32bits.is_true
			else
				Result := default_force_32bits
			end
		end

	fst_expansion_factor: INTEGER
			-- 'fst_expansion_factor' option
		do
			if is_fst_expansion_factor_declared then
				Result := declared_fst_expansion_factor
			else
				Result := default_fst_expansion_factor
			end
		ensure
			fst_expansion_factor_positive: Result >= 0
		end

	fst_optimization: BOOLEAN
			-- 'fst_optimization' option
		do
			if is_fst_optimization_declared and then attached declared_fst_optimization as l_declared_fst_optimization then
				Result := l_declared_fst_optimization.is_true
			else
				Result := default_fst_optimization
			end
		end

	full_class_checking: BOOLEAN
			-- 'full_class_checking' option
		do
			if is_full_class_checking_declared and then attached declared_full_class_checking as l_declared_full_class_checking then
				Result := l_declared_full_class_checking.is_true
			else
				Result := default_full_class_checking
			end
		end

	garbage_collector: STRING
			-- 'garbage_collector' option
		do
			if attached declared_garbage_collector as l_declared_garbage_collector then
				check is_garbage_collector_declared: is_garbage_collector_declared end
				Result := l_declared_garbage_collector
			else
				Result := default_garbage_collector
			end
		ensure
			garbage_collector_not_void: Result /= Void
			valid_garbage_collector: valid_garbage_collector.has (Result)
		end

	gc_info: BOOLEAN
			-- 'gc_info' option
		do
			if is_gc_info_declared and then attached declared_gc_info as l_declared_gc_info then
				Result := l_declared_gc_info.is_true
			else
				Result := default_gc_info
			end
		end

	heap_size: INTEGER
			-- 'heap_size' option
		do
			if is_heap_size_declared then
				Result := declared_heap_size
			else
				Result := default_heap_size
			end
		end

	header: DS_HASH_SET [STRING]
			-- 'header' option
		do
			if is_header_declared and then attached declared_header as l_declared_header then
				Result := l_declared_header
			else
				Result := default_header
			end
		ensure
			header_not_void: Result /= Void
			no_void_header: not Result.has_void
		end

	high_memory_compiler: BOOLEAN
			-- 'high_memory_compiler' option
		do
			if is_high_memory_compiler_declared and then attached declared_high_memory_compiler as l_declared_high_memory_compiler then
				Result := l_declared_high_memory_compiler.is_true
			else
				Result := default_high_memory_compiler
			end
		end

	il_verifiable: BOOLEAN
			-- 'il_verifiable' option
		do
			if is_il_verifiable_declared and then attached declared_il_verifiable as l_declared_il_verifiable then
				Result := l_declared_il_verifiable.is_true
			else
				Result := default_il_verifiable
			end
		end

	include: DS_HASH_SET [STRING]
			-- 'include' option
		do
			if is_include_declared and then attached declared_include as l_declared_include then
				Result := l_declared_include
			else
				Result := default_include
			end
		ensure
			include_not_void: Result /= Void
			no_void_include: not Result.has_void
		end

	inlining: DS_HASH_SET [STRING]
			-- 'inlining' option
		do
			if is_inlining_declared and then attached declared_inlining as l_declared_inlining then
				Result := l_declared_inlining
			else
				Result := default_inlining
			end
		ensure
			inlining_not_void: Result /= Void
			-- valid_value: forall v in Result, valid_inlining.has (v)
		end

	inlining_size: INTEGER
			-- 'inlining_size' option
		do
			if is_inlining_size_declared then
				Result := declared_inlining_size
			else
				Result := default_inlining_size
			end
		ensure
			inlining_size_positive: Result >= 0
		end

	jumps_optimization: BOOLEAN
			-- 'jumps_optimization' option
		do
			if is_jumps_optimization_declared and then attached declared_jumps_optimization as l_declared_jumps_optimization then
				Result := l_declared_jumps_optimization.is_true
			else
				Result := default_jumps_optimization
			end
		end

	layout: STRING
			-- 'layout' option
		do
			if is_layout_declared and then attached declared_layout as l_declared_layout then
				Result := l_declared_layout
			else
				Result := default_layout
			end
		ensure
			layout_not_void: Result /= Void
			valid_layout: valid_layout.has (Result)
		end

	layout_optimization: BOOLEAN
			-- 'layout_optimization' option
		do
			if is_layout_optimization_declared and then attached declared_layout_optimization as l_declared_layout_optimization then
				Result := l_declared_layout_optimization.is_true
			else
				Result := default_layout_optimization
			end
		end

	leaves_optimization: BOOLEAN
			-- 'leaves_optimization' option
		do
			if is_leaves_optimization_declared and then attached declared_leaves_optimization as l_declared_leaves_optimization then
				Result := l_declared_leaves_optimization.is_true
			else
				Result := default_leaves_optimization
			end
		end

	line_generation: BOOLEAN
			-- 'line_generation' option
		do
			if is_line_generation_declared and then attached declared_line_generation as l_declared_line_generation then
				Result := l_declared_line_generation.is_true
			else
				Result := default_line_generation
			end
		end

	link: DS_ARRAYED_LIST [STRING]
			-- 'link' option
		do
			if is_link_declared and then attached declared_link as l_declared_link then
				Result := l_declared_link
			else
				Result := default_link
			end
		ensure
			link_not_void: Result /= Void
			no_void_link: not Result.has_void
		end

	linker: STRING
			-- 'linker' option
		do
			if attached declared_linker as l_declared_linker then
				check is_linker_declared: is_linker_declared end
				Result := l_declared_linker
			else
				Result := default_linker
			end
		ensure
			linker_not_void: Result /= Void
			valid_linker: valid_linker.has (Result)
		end

	linux_fpu_double_precision: BOOLEAN
			-- 'linux_fpu_double_precision' option
		do
			if is_linux_fpu_double_precision_declared and then attached declared_linux_fpu_double_precision as l_declared_linux_fpu_double_precision then
				Result := l_declared_linux_fpu_double_precision.is_true
			else
				Result := default_linux_fpu_double_precision
			end
		end

	manifest_string_trace: BOOLEAN
			-- 'manifest_string_trace' option
		do
			if is_manifest_string_trace_declared and then attached declared_manifest_string_trace as l_declared_manifest_string_trace then
				Result := l_declared_manifest_string_trace.is_true
			else
				Result := default_manifest_string_trace
			end
		end

	map: BOOLEAN
			-- 'map' option
		do
			if is_map_declared and then attached declared_map as l_declared_map then
				Result := l_declared_map.is_true
			else
				Result := default_map
			end
		end

	metadata_cache_path: detachable STRING
			-- 'metadata_cache_path' option
		do
			if is_metadata_cache_path_declared then
				Result := declared_metadata_cache_path
			else
				Result := default_metadata_cache_path
			end
		end

	msil_assembly_compatibility: detachable STRING
			-- 'msil_assembly_compatibility' option
		do
			if is_msil_assembly_compatibility_declared then
				Result := declared_msil_assembly_compatibility
			else
				Result := default_msil_assembly_compatibility
			end
		end

	msil_classes_per_module: INTEGER
			-- 'msil_classes_per_module' option
		do
			if is_msil_classes_per_module_declared then
				Result := declared_msil_classes_per_module
			else
				Result := default_msil_classes_per_module
			end
		ensure
			msil_classes_per_module_positive: Result > 0
		end

	msil_clr_version: detachable STRING
			-- 'msil_clr_version' option
		do
			if is_msil_clr_version_declared then
				Result := declared_msil_clr_version
			else
				Result := default_msil_clr_version
			end
		end

	msil_culture: detachable STRING
			-- 'msil_culture' option
		do
			if is_msil_culture_declared then
				Result := declared_msil_culture
			else
				Result := default_msil_culture
			end
		end

	msil_generation: BOOLEAN
			-- 'msil_generation' option
		do
			if is_msil_generation_declared and then attached declared_msil_generation as l_declared_msil_generation then
				Result := l_declared_msil_generation.is_true
			else
				Result := default_msil_generation
			end
		end

	msil_generation_version: detachable STRING
			-- 'msil_generation_version' option
		do
			if is_msil_generation_version_declared then
				Result := declared_msil_generation_version
			else
				Result := default_msil_generation_version
			end
		end

	msil_key_file_name: detachable STRING
			-- 'msil_key_file_name' option
		do
			if is_msil_key_file_name_declared then
				Result := declared_msil_key_file_name
			else
				Result := default_msil_key_file_name
			end
		end

	msil_use_optimized_precompile: BOOLEAN
			-- 'msil_use_optimized_precompile' option
		do
			if is_msil_use_optimized_precompile_declared and then attached declared_msil_use_optimized_precompile as l_declared_msil_use_optimized_precompile then
				Result := l_declared_msil_use_optimized_precompile.is_true
			else
				Result := default_msil_use_optimized_precompile
			end
		end

	multithreaded: BOOLEAN
			-- 'multithreaded' option
		do
			if is_multithreaded_declared and then attached declared_multithreaded as l_declared_multithreaded then
				Result := l_declared_multithreaded.is_true
			else
				Result := default_multithreaded
			end
		end

	namespace: detachable STRING
			-- 'namespace' option
		do
			if is_namespace_declared then
				Result := declared_namespace
			else
				Result := default_namespace
			end
		end

	no_default_lib: BOOLEAN
			-- 'no_default_lib' option
		do
			if is_no_default_lib_declared and then attached declared_no_default_lib as l_declared_no_default_lib then
				Result := l_declared_no_default_lib.is_true
			else
				Result := default_no_default_lib
			end
		end

	old_verbatim_strings: BOOLEAN
			-- 'old_verbatim_strings' option
		do
			if is_old_verbatim_strings_declared and then attached declared_old_verbatim_strings as l_declared_old_verbatim_strings then
				Result := l_declared_old_verbatim_strings.is_true
			else
				Result := default_old_verbatim_strings
			end
		end

	override_cluster: DS_HASH_SET [STRING]
			-- 'override_cluster' option
		do
			if is_override_cluster_declared and then attached declared_override_cluster as l_declared_override_cluster then
				Result := l_declared_override_cluster
			else
				Result := default_override_cluster
			end
		ensure
			override_cluster_not_void: Result /= Void
			no_void_override_cluster: not Result.has_void
		end

	portable_code_generation: BOOLEAN
			-- 'portable_code_generation' option
		do
			if is_portable_code_generation_declared and then attached declared_portable_code_generation as l_declared_portable_code_generation then
				Result := l_declared_portable_code_generation.is_true
			else
				Result := default_portable_code_generation
			end
		end

	precompiled: detachable STRING
			-- 'precompiled' option
		do
			if is_precompiled_declared then
				Result := declared_precompiled
			else
				Result := default_precompiled
			end
		end

	prefix_option: detachable STRING
			-- 'prefix' option
		do
			if is_prefix_option_declared then
				Result := declared_prefix_option
			else
				Result := default_prefix_option
			end
		end

	profile: BOOLEAN
			-- 'profile' option
		do
			if is_profile_declared and then attached declared_profile as l_declared_profile then
				Result := l_declared_profile.is_true
			else
				Result := default_profile
			end
		end

	public_key_token: STRING
			-- 'public_key_token' option
		do
			if attached declared_public_key_token as l_declared_public_key_token then
				check is_public_key_token_declared: is_public_key_token_declared end
				Result := l_declared_public_key_token
			else
				Result := default_public_key_token
			end
		ensure
			public_key_token_not_void: Result /= Void
		end

	read_only: BOOLEAN
			-- 'read_only' option
		do
			if is_read_only_declared and then attached declared_read_only as l_declared_read_only then
				Result := l_declared_read_only.is_true
			else
				Result := default_read_only
			end
		end

	recursive: BOOLEAN
			-- 'recursive' option
		do
			if is_recursive_declared and then attached declared_recursive as l_declared_recursive then
				Result := l_declared_recursive.is_true
			else
				Result := default_recursive
			end
		end

	reloads_optimization: BOOLEAN
			-- 'reloads_optimization' option
		do
			if is_reloads_optimization_declared and then attached declared_reloads_optimization as l_declared_reloads_optimization then
				Result := l_declared_reloads_optimization.is_true
			else
				Result := default_reloads_optimization
			end
		end

	shared_library_definition: detachable STRING
			-- 'shared_library_definition' option
		do
			if is_shared_library_definition_declared then
				Result := declared_shared_library_definition
			else
				Result := default_shared_library_definition
			end
		end

	split: BOOLEAN
			-- 'split' option
		do
			if is_split_declared and then attached declared_split as l_declared_split then
				Result := l_declared_split.is_true
			else
				Result := default_split
			end
		end

	stack_size: INTEGER
			-- 'stack_size' option
		do
			if is_stack_size_declared then
				Result := declared_stack_size
			else
				Result := default_stack_size
			end
		end

	storable: BOOLEAN
			-- 'storable' option
		do
			if is_storable_declared and then attached declared_storable as l_declared_storable then
				Result := l_declared_storable.is_true
			else
				Result := default_storable
			end
		end

	storable_filename: detachable STRING
			-- 'storable_filename' option
		do
			if is_storable_filename_declared then
				Result := declared_storable_filename
			else
				Result := default_storable_filename
			end
		end

	strip_option: BOOLEAN
			-- 'strip' option
		do
			if is_strip_option_declared and then attached declared_strip_option as l_declared_strip_option then
				Result := l_declared_strip_option.is_true
			else
				Result := default_strip_option
			end
		end

	syntax: STRING
			-- 'syntax' option
		do
			if attached declared_syntax as l_declared_syntax then
				check is_syntax_declared: is_syntax_declared end
				Result := l_declared_syntax
			else
				Result := default_syntax
			end
		ensure
			syntax_not_void: Result /= Void
			valid_syntax: valid_syntax.has (Result)
		end

	target: STRING
			-- 'target' option
		do
			if attached declared_target as l_declared_target then
				check is_target_declared: is_target_declared end
				Result := l_declared_target
			else
				Result := default_target
			end
		ensure
			target_not_void: Result /= Void
			valid_target: valid_target.has (Result)
		end

	trace: BOOLEAN
			-- 'trace' option
		do
			if is_trace_declared and then attached declared_trace as l_declared_trace then
				Result := l_declared_trace.is_true
			else
				Result := default_trace
			end
		end

	use_cluster_name_as_namespace: BOOLEAN
			-- 'use_cluster_name_as_namespace' option
		do
			if is_use_cluster_name_as_namespace_declared and then attached declared_use_cluster_name_as_namespace as l_declared_use_cluster_name_as_namespace then
				Result := l_declared_use_cluster_name_as_namespace.is_true
			else
				Result := default_use_cluster_name_as_namespace
			end
		end

	use_full_cluster_name_as_namespace: BOOLEAN
			-- 'use_full_cluster_name_as_namespace' option
		do
			if is_use_full_cluster_name_as_namespace_declared and then attached declared_use_full_cluster_name_as_namespace as l_declared_use_full_cluster_name_as_namespace then
				Result := l_declared_use_full_cluster_name_as_namespace.is_true
			else
				Result := default_use_full_cluster_name_as_namespace
			end
		end

	verbose: BOOLEAN
			-- 'verbose' option
		do
			if is_verbose_declared and then attached declared_verbose as l_declared_verbose then
				Result := l_declared_verbose.is_true
			else
				Result := default_verbose
			end
		end

	version: STRING
			-- 'version' option
		do
			if attached declared_version as l_declared_version then
				check is_version_declared: is_version_declared end
				Result := l_declared_version
			else
				Result := default_version
			end
		ensure
			version_not_void: Result /= Void
		end

	visible_filename: detachable STRING
			-- 'visible_filename' option
		do
			if is_visible_filename_declared then
				Result := declared_visible_filename
			else
				Result := default_visible_filename
			end
		end

	void_safety: STRING
			-- 'void_safety' option
		do
			if attached declared_void_safety as l_declared_void_safety then
				check is_void_safety_declared: is_void_safety_declared end
				Result := l_declared_void_safety
			else
				Result := default_void_safety
			end
		ensure
			void_safety_not_void: Result /= Void
		end

	warning: STRING
			-- 'warning' option
		do
			if attached declared_warning as l_declared_warning then
				check is_warning_declared: is_warning_declared end
				Result := l_declared_warning
			else
				Result := default_warning
			end
		ensure
			warning_not_void: Result /= Void
			valid_warning: valid_warning.has (Result)
		end

	wedit: BOOLEAN
			-- 'wedit' option
		do
			if is_wedit_declared and then attached declared_wedit as l_declared_wedit then
				Result := l_declared_wedit.is_true
			else
				Result := default_wedit
			end
		end

feature -- Modification

	set_abstract (b: BOOLEAN)
			-- Set `abstract' to `b'.
		local
			l_declared_abstract: like declared_abstract
		do
			l_declared_abstract := declared_abstract
			if l_declared_abstract = Void then
				create l_declared_abstract.make_undefined
				declared_abstract := l_declared_abstract
			end
			if b then
				l_declared_abstract.set_true
			else
				l_declared_abstract.set_false
			end
		ensure
			abstract_declared: is_abstract_declared
			abstract_set: abstract = b
		end

	set_address_expression (b: BOOLEAN)
			-- Set `address_expression' to `b'.
		local
			l_declared_address_expression: like declared_address_expression
		do
			l_declared_address_expression := declared_address_expression
			if l_declared_address_expression = Void then
				create l_declared_address_expression.make_undefined
				declared_address_expression := l_declared_address_expression
			end
			if b then
				l_declared_address_expression.set_true
			else
				l_declared_address_expression.set_false
			end
		ensure
			address_expression_declared: is_address_expression_declared
			address_expression_set: address_expression = b
		end

	set_arguments (a_value: STRING)
			-- Set `arguments' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		local
			l_declared_arguments: like declared_arguments
		do
			l_declared_arguments := declared_arguments
			if l_declared_arguments = Void then
				create l_declared_arguments.make (10)
				l_declared_arguments.set_equality_tester (string_equality_tester)
				declared_arguments := l_declared_arguments
			end
			l_declared_arguments.force_last (a_value)
		ensure
			arguments_declared: is_arguments_declared
			arguments_set: arguments.has (a_value)
		end

	set_array_optimization (b: BOOLEAN)
			-- Set `array_optimization' to `b'.
		local
			l_declared_array_optimization: like declared_array_optimization
		do
			l_declared_array_optimization := declared_array_optimization
			if l_declared_array_optimization = Void then
				create l_declared_array_optimization.make_undefined
				declared_array_optimization := l_declared_array_optimization
			end
			if b then
				l_declared_array_optimization.set_true
			else
				l_declared_array_optimization.set_false
			end
		ensure
			array_optimization_declared: is_array_optimization_declared
			array_optimization_set: array_optimization = b
		end

	set_assembly (a_value: STRING)
			-- Set `assembly' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_assembly := a_value
		ensure
			assembly_declared: is_assembly_declared
			assembly_set: assembly = a_value
		end

	set_assertion (a_value: STRING)
			-- Set `assertion' to `a_value'.
		require
			a_value_valid: valid_assertion.has (a_value)
		local
			l_declared_assertion: like declared_assertion
		do
			l_declared_assertion := declared_assertion
			if l_declared_assertion = Void then
				create l_declared_assertion.make (valid_assertion.count)
				l_declared_assertion.set_equality_tester (string_equality_tester)
				declared_assertion := l_declared_assertion
			end
			l_declared_assertion.force_last (a_value)
		ensure
			assertion_declared: is_assertion_declared
			assertion_set: assertion.has (a_value)
		end

	set_attached_by_default (b: BOOLEAN)
			-- Set `attached_by_default' to `b'.
		local
			l_declared_attached_by_default: like declared_attached_by_default
		do
			l_declared_attached_by_default := declared_attached_by_default
			if l_declared_attached_by_default = Void then
				create l_declared_attached_by_default.make_undefined
				declared_attached_by_default := l_declared_attached_by_default
			end
			if b then
				l_declared_attached_by_default.set_true
			else
				l_declared_attached_by_default.set_false
			end
		ensure
			abstract_declared: is_abstract_declared
			abstract_set: abstract = b
		end

	set_automatic_backup (b: BOOLEAN)
			-- Set `automatic_backup' to `b'.
		local
			l_declared_automatic_backup: like declared_automatic_backup
		do
			l_declared_automatic_backup := declared_automatic_backup
			if l_declared_automatic_backup = Void then
				create l_declared_automatic_backup.make_undefined
				declared_automatic_backup := l_declared_automatic_backup
			end
			if b then
				l_declared_automatic_backup.set_true
			else
				l_declared_automatic_backup.set_false
			end
		ensure
			automatic_backup_declared: is_automatic_backup_declared
			automatic_backup_set: automatic_backup = b
		end

	set_callback (a_value: STRING)
			-- Set `callback' to `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_value_valid: valid_callback.has (a_value)
		do
			declared_callback := a_value
		ensure
			callback_declared: is_callback_declared
			callback_set: callback = a_value
		end

	set_case_insensitive (b: BOOLEAN)
			-- Set `case_insensitive' to `b'.
		local
			l_declared_case_insensitive: like declared_case_insensitive
		do
			l_declared_case_insensitive := declared_case_insensitive
			if l_declared_case_insensitive = Void then
				create l_declared_case_insensitive.make_undefined
				declared_case_insensitive := l_declared_case_insensitive
			end
			if b then
				l_declared_case_insensitive.set_true
			else
				l_declared_case_insensitive.set_false
			end
		ensure
			case_insensitive_declared: is_case_insensitive_declared
			case_insensitive_set: case_insensitive = b
		end

	set_check_generic_creation_constraint (b: BOOLEAN)
			-- Set `check_generic_creation_constraint' to `b'.
		local
			l_declared_check_generic_creation_constraint: like declared_check_generic_creation_constraint
		do
			l_declared_check_generic_creation_constraint := declared_check_generic_creation_constraint
			if l_declared_check_generic_creation_constraint = Void then
				create l_declared_check_generic_creation_constraint.make_undefined
				declared_check_generic_creation_constraint := l_declared_check_generic_creation_constraint
			end
			if b then
				l_declared_check_generic_creation_constraint.set_true
			else
				l_declared_check_generic_creation_constraint.set_false
			end
		ensure
			check_generic_creation_constraint_declared: is_check_generic_creation_constraint_declared
			check_generic_creation_constraint_set: check_generic_creation_constraint = b
		end

	set_check_vape (b: BOOLEAN)
			-- Set `check_vape' to `b'.
		local
			l_declared_check_vape: like declared_check_vape
		do
			l_declared_check_vape := declared_check_vape
			if l_declared_check_vape = Void then
				create l_declared_check_vape.make_undefined
				declared_check_vape := l_declared_check_vape
			end
			if b then
				l_declared_check_vape.set_true
			else
				l_declared_check_vape.set_false
			end
		ensure
			check_vape_declared: is_check_vape_declared
			check_vape_set: check_vape = b
		end

	set_clean (b: BOOLEAN)
			-- Set `clean' to `b'.
		local
			l_declared_clean: like declared_clean
		do
			l_declared_clean := declared_clean
			if l_declared_clean = Void then
				create l_declared_clean.make_undefined
				declared_clean := l_declared_clean
			end
			if b then
				l_declared_clean.set_true
			else
				l_declared_clean.set_false
			end
		ensure
			clean_declared: is_clean_declared
			clean_set: clean = b
		end

	set_cls_compliant (b: BOOLEAN)
			-- Set `cls_compliant' to `b'.
		local
			l_declared_cls_compliant: like declared_cls_compliant
		do
			l_declared_cls_compliant := declared_cls_compliant
			if l_declared_cls_compliant = Void then
				create l_declared_cls_compliant.make_undefined
				declared_cls_compliant := l_declared_cls_compliant
			end
			if b then
				l_declared_cls_compliant.set_true
			else
				l_declared_cls_compliant.set_false
			end
		ensure
			cls_compliant_declared: is_cls_compliant_declared
			cls_compliant_set: cls_compliant = b
		end

	set_component (a_value: STRING)
			-- Set `component' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_component := a_value
		ensure
			component_declared: is_component_declared
			component_set: component = a_value
		end

	set_console_application (b: BOOLEAN)
			-- Set `console_application' to `b'.
		local
			l_declared_console_application: like declared_console_application
		do
			l_declared_console_application := declared_console_application
			if l_declared_console_application = Void then
				create l_declared_console_application.make_undefined
				declared_console_application := l_declared_console_application
			end
			if b then
				l_declared_console_application.set_true
			else
				l_declared_console_application.set_false
			end
		ensure
			console_application_declared: is_console_application_declared
			console_application_set: console_application = b
		end

	set_create_keyword_extension (b: BOOLEAN)
			-- Set `create_keyword_extension' to `b'.
		local
			l_declared_create_keyword_extension: like declared_create_keyword_extension
		do
			l_declared_create_keyword_extension := declared_create_keyword_extension
			if l_declared_create_keyword_extension = Void then
				create l_declared_create_keyword_extension.make_undefined
				declared_create_keyword_extension := l_declared_create_keyword_extension
			end
			if b then
				l_declared_create_keyword_extension.set_true
			else
				l_declared_create_keyword_extension.set_false
			end
		ensure
			create_keyword_extension_declared: is_create_keyword_extension_declared
			create_keyword_extension_set: create_keyword_extension = b
		end

	set_culture (a_value: STRING)
			-- Set `culture' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_culture := a_value
		ensure
			culture_declared: is_culture_declared
			culture_set: culture = a_value
		end

	set_c_compiler_options (a_value: STRING)
			-- Set `c_compiler_options' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		local
			l_declared_c_compiler_options: like declared_c_compiler_options
		do
			l_declared_c_compiler_options := declared_c_compiler_options
			if l_declared_c_compiler_options = Void then
				create l_declared_c_compiler_options.make (10)
				l_declared_c_compiler_options.set_equality_tester (string_equality_tester)
				declared_c_compiler_options := l_declared_c_compiler_options
			end
			l_declared_c_compiler_options.force_last (a_value)
		ensure
			c_compiler_options_declared: is_c_compiler_options_declared
			c_compiler_options_set: c_compiler_options.has (a_value)
		end

	set_dead_code_removal (a_value: STRING)
			-- Set `dead_code_removal' to `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_value_valid: valid_dead_code_removal.has (a_value)
		local
			l_declared_dead_code_removal: like declared_dead_code_removal
		do
			l_declared_dead_code_removal := declared_dead_code_removal
			if l_declared_dead_code_removal = Void then
				create l_declared_dead_code_removal.make (valid_dead_code_removal.count)
				l_declared_dead_code_removal.set_equality_tester (string_equality_tester)
				declared_dead_code_removal := l_declared_dead_code_removal
			end
			l_declared_dead_code_removal.force_last (a_value)
		ensure
			dead_code_removal_declared: is_dead_code_removal_declared
			dead_code_removal_set: dead_code_removal.has (a_value)
		end

	set_debug_option (b: BOOLEAN)
			-- Set `debug_option' to `b'.
		local
			l_declared_debug_option: like declared_debug_option
		do
			l_declared_debug_option := declared_debug_option
			if l_declared_debug_option = Void then
				create l_declared_debug_option.make_undefined
				declared_debug_option := l_declared_debug_option
			end
			if b then
				l_declared_debug_option.set_true
			else
				l_declared_debug_option.set_false
			end
		ensure
			debug_option_declared: is_debug_option_declared
			debug_option_set: debug_option = b
		end

	set_debug_tag (a_value: STRING)
			-- Set `debug_tag' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		local
			l_declared_debug_tag: like declared_debug_tag
		do
			l_declared_debug_tag := declared_debug_tag
			if l_declared_debug_tag = Void then
				create l_declared_debug_tag.make (10)
				l_declared_debug_tag.set_equality_tester (string_equality_tester)
				declared_debug_tag := l_declared_debug_tag
			end
			l_declared_debug_tag.force_last (a_value)
		ensure
			debug_tag_declared: is_debug_tag_declared
			debug_tag_set: debug_tag.has (a_value)
		end

	set_debugger (b: BOOLEAN)
			-- Set `debugger' to `b'.
		local
			l_declared_debugger: like declared_debugger
		do
			l_declared_debugger := declared_debugger
			if l_declared_debugger = Void then
				create l_declared_debugger.make_undefined
				declared_debugger := l_declared_debugger
			end
			if b then
				l_declared_debugger.set_true
			else
				l_declared_debugger.set_false
			end
		ensure
			debugger_declared: is_debugger_declared
			debugger_set: debugger = b
		end

	set_document (a_value: STRING)
			-- Set `document' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_document := a_value
		ensure
			document_declared: is_document_declared
			document_set: document = a_value
		end

	set_dotnet_naming_convention (b: BOOLEAN)
			-- Set `dotnet_naming_convention' to `b'.
		local
			l_declared_dotnet_naming_convention: like declared_dotnet_naming_convention
		do
			l_declared_dotnet_naming_convention := declared_dotnet_naming_convention
			if l_declared_dotnet_naming_convention = Void then
				create l_declared_dotnet_naming_convention.make_undefined
				declared_dotnet_naming_convention := l_declared_dotnet_naming_convention
			end
			if b then
				l_declared_dotnet_naming_convention.set_true
			else
				l_declared_dotnet_naming_convention.set_false
			end
		ensure
			dotnet_naming_convention_declared: is_dotnet_naming_convention_declared
			dotnet_naming_convention_set: dotnet_naming_convention = b
		end

	set_dynamic_runtime (b: BOOLEAN)
			-- Set `dynamic_runtime' to `b'.
		local
			l_declared_dynamic_runtime: like declared_dynamic_runtime
		do
			l_declared_dynamic_runtime := declared_dynamic_runtime
			if l_declared_dynamic_runtime = Void then
				create l_declared_dynamic_runtime.make_undefined
				declared_dynamic_runtime := l_declared_dynamic_runtime
			end
			if b then
				l_declared_dynamic_runtime.set_true
			else
				l_declared_dynamic_runtime.set_false
			end
		ensure
			dynamic_runtime_declared: is_dynamic_runtime_declared
			dynamic_runtime_set: dynamic_runtime = b
		end

	set_ecf_library (a_value: STRING)
			-- Set `ecf_library' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_ecf_library := a_value
		ensure
			ecf_library_declared: is_ecf_library_declared
			ecf_library_set: ecf_library = a_value
		end

	set_enforce_unique_class_names (b: BOOLEAN)
			-- Set `enforce_unique_class_names' to `b'.
		local
			l_declared_enforce_unique_class_names: like declared_enforce_unique_class_names
		do
			l_declared_enforce_unique_class_names := declared_enforce_unique_class_names
			if l_declared_enforce_unique_class_names = Void then
				create l_declared_enforce_unique_class_names.make_undefined
				declared_enforce_unique_class_names := l_declared_enforce_unique_class_names
			end
			if b then
				l_declared_enforce_unique_class_names.set_true
			else
				l_declared_enforce_unique_class_names.set_false
			end
		ensure
			enforce_unique_class_names_declared: is_enforce_unique_class_names_declared
			enforce_unique_class_names_set: enforce_unique_class_names = b
		end

	set_exception_trace (b: BOOLEAN)
			-- Set `exception_trace' to `b'.
		local
			l_declared_exception_trace: like declared_exception_trace
		do
			l_declared_exception_trace := declared_exception_trace
			if l_declared_exception_trace = Void then
				create l_declared_exception_trace.make_undefined
				declared_exception_trace := l_declared_exception_trace
			end
			if b then
				l_declared_exception_trace.set_true
			else
				l_declared_exception_trace.set_false
			end
		ensure
			exception_trace_declared: is_exception_trace_declared
			exception_trace_set: exception_trace = b
		end

	set_exclude (a_value: STRING)
			-- Set `exclude' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		local
			l_declared_exclude: like declared_exclude
		do
			l_declared_exclude := declared_exclude
			if l_declared_exclude = Void then
				create l_declared_exclude.make (10)
				l_declared_exclude.set_equality_tester (string_equality_tester)
				declared_exclude := l_declared_exclude
			end
			l_declared_exclude.force_last (a_value)
		ensure
			exclude_declared: is_exclude_declared
			exclude_set: exclude.has (a_value)
		end

	set_export_option (a_value: STRING)
			-- Set `export_option' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_export_option := a_value
		ensure
			export_option_declared: is_export_option_declared
			export_option_set: export_option = a_value
		end

	set_external_runtime (a_value: STRING)
			-- Set `external_runtime' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_external_runtime := a_value
		ensure
			external_runtime_declared: is_external_runtime_declared
			external_runtime_set: external_runtime = a_value
		end

	set_finalize_option (b: BOOLEAN)
			-- Set `finalize_option' to `b'.
		local
			l_declared_finalize_option: like declared_finalize_option
		do
			l_declared_finalize_option := declared_finalize_option
			if l_declared_finalize_option = Void then
				create l_declared_finalize_option.make_undefined
				declared_finalize_option := l_declared_finalize_option
			end
			if b then
				l_declared_finalize_option.set_true
			else
				l_declared_finalize_option.set_false
			end
		ensure
			finalize_option_declared: is_finalize_option_declared
			finalize_option_set: finalize_option = b
		end

	set_flat_fst_optimization (b: BOOLEAN)
			-- Set `flat_fst_optimization' to `b'.
		local
			l_declared_flat_fst_optimization: like declared_flat_fst_optimization
		do
			l_declared_flat_fst_optimization := declared_flat_fst_optimization
			if l_declared_flat_fst_optimization = Void then
				create l_declared_flat_fst_optimization.make_undefined
				declared_flat_fst_optimization := l_declared_flat_fst_optimization
			end
			if b then
				l_declared_flat_fst_optimization.set_true
			else
				l_declared_flat_fst_optimization.set_false
			end
		ensure
			flat_fst_optimization_declared: is_flat_fst_optimization_declared
			flat_fst_optimization_set: flat_fst_optimization = b
		end

	set_force_32bits (b: BOOLEAN)
			-- Set `force_32bits' to `b'.
		local
			l_declared_force_32bits: like declared_force_32bits
		do
			l_declared_force_32bits := declared_force_32bits
			if l_declared_force_32bits = Void then
				create l_declared_force_32bits.make_undefined
				declared_force_32bits := l_declared_force_32bits
			end
			if b then
				l_declared_force_32bits.set_true
			else
				l_declared_force_32bits.set_false
			end
		ensure
			force_32bits_declared: is_force_32bits_declared
			force_32bits_set: force_32bits = b
		end

	set_fst_expansion_factor (v: INTEGER)
			-- Set `fst_expansion_factor' to `v'.
		require
			v_positive: v >= 0
		do
			declared_fst_expansion_factor := v
		ensure
			fst_expansion_factor_declared: is_fst_expansion_factor_declared
			fst_expansion_factor_set: fst_expansion_factor = v
		end

	set_fst_optimization (b: BOOLEAN)
			-- Set `fst_optimization' to `b'.
		local
			l_declared_fst_optimization: like declared_fst_optimization
		do
			l_declared_fst_optimization := declared_fst_optimization
			if l_declared_fst_optimization = Void then
				create l_declared_fst_optimization.make_undefined
				declared_fst_optimization := l_declared_fst_optimization
			end
			if b then
				l_declared_fst_optimization.set_true
			else
				l_declared_fst_optimization.set_false
			end
		ensure
			fst_optimization_declared: is_fst_optimization_declared
			fst_optimization_set: fst_optimization = b
		end

	set_full_class_checking (b: BOOLEAN)
			-- Set `full_class_checking' to `b'.
		local
			l_declared_full_class_checking: like declared_full_class_checking
		do
			l_declared_full_class_checking := declared_full_class_checking
			if l_declared_full_class_checking = Void then
				create l_declared_full_class_checking.make_undefined
				declared_full_class_checking := l_declared_full_class_checking
			end
			if b then
				l_declared_full_class_checking.set_true
			else
				l_declared_full_class_checking.set_false
			end
		ensure
			full_class_checking_declared: is_full_class_checking_declared
			full_class_checking_set: full_class_checking = b
		end

	set_garbage_collector (a_value: STRING)
			-- Set `garbage_collector' to `a_value'.
		require
			a_value_valid: valid_garbage_collector.has (a_value)
		do
			declared_garbage_collector := a_value
		ensure
			garbage_collector_declared: is_garbage_collector_declared
			garbage_collector_set: garbage_collector = a_value
		end

	set_gc_info (b: BOOLEAN)
			-- Set `gc_info' to `b'.
		local
			l_declared_gc_info: like declared_gc_info
		do
			l_declared_gc_info := declared_gc_info
			if l_declared_gc_info = Void then
				create l_declared_gc_info.make_undefined
				declared_gc_info := l_declared_gc_info
			end
			if b then
				l_declared_gc_info.set_true
			else
				l_declared_gc_info.set_false
			end
		ensure
			gc_info_declared: is_gc_info_declared
			gc_info_set: gc_info = b
		end

	set_heap_size (v: INTEGER)
			-- Set `heap_size' to `v'.
		require
			v_positive: v >= 0
		do
			declared_heap_size := v
		ensure
			heap_size_declared: is_heap_size_declared
			heap_size_set: heap_size = v
		end

	set_header (a_value: STRING)
			-- Set `header' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		local
			l_declared_header: like declared_header
		do
			l_declared_header := declared_header
			if l_declared_header = Void then
				create l_declared_header.make (10)
				l_declared_header.set_equality_tester (string_equality_tester)
				declared_header := l_declared_header
			end
			l_declared_header.force_last (a_value)
		ensure
			header_declared: is_header_declared
			header_set: header.has (a_value)
		end

	set_high_memory_compiler (b: BOOLEAN)
			-- Set `high_memory_compiler' to `b'.
		local
			l_declared_high_memory_compiler: like declared_high_memory_compiler
		do
			l_declared_high_memory_compiler := declared_high_memory_compiler
			if l_declared_high_memory_compiler = Void then
				create l_declared_high_memory_compiler.make_undefined
				declared_high_memory_compiler := l_declared_high_memory_compiler
			end
			if b then
				l_declared_high_memory_compiler.set_true
			else
				l_declared_high_memory_compiler.set_false
			end
		ensure
			high_memory_compiler_declared: is_high_memory_compiler_declared
			high_memory_compiler_set: high_memory_compiler = b
		end

	set_il_verifiable (b: BOOLEAN)
			-- Set `il_verifiable' to `b'.
		local
			l_declared_il_verifiable: like declared_il_verifiable
		do
			l_declared_il_verifiable := declared_il_verifiable
			if l_declared_il_verifiable = Void then
				create l_declared_il_verifiable.make_undefined
				declared_il_verifiable := l_declared_il_verifiable
			end
			if b then
				l_declared_il_verifiable.set_true
			else
				l_declared_il_verifiable.set_false
			end
		ensure
			il_verifiable_declared: is_il_verifiable_declared
			il_verifiable_set: il_verifiable = b
		end

	set_include (a_value: STRING)
			-- Set `include' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		local
			l_declared_include: like declared_include
		do
			l_declared_include := declared_include
			if l_declared_include = Void then
				create l_declared_include.make (10)
				l_declared_include.set_equality_tester (string_equality_tester)
				declared_include := l_declared_include
			end
			l_declared_include.force_last (a_value)
		ensure
			include_declared: is_include_declared
			include_set: include.has (a_value)
		end

	set_inlining (a_value: STRING)
			-- Set `inlining' to `a_value'.
		require
			a_value_valid: valid_inlining.has (a_value)
		local
			l_declared_inlining: like declared_inlining
		do
			l_declared_inlining := declared_inlining
			if l_declared_inlining = Void then
				create l_declared_inlining.make (valid_inlining.count)
				l_declared_inlining.set_equality_tester (string_equality_tester)
				declared_inlining := l_declared_inlining
			end
			l_declared_inlining.force_last (a_value)
		ensure
			inlining_declared: is_inlining_declared
			inlining_set: inlining.has (a_value)
		end

	set_inlining_size (v: INTEGER)
			-- Set `inlining_size' to `v'.
		require
			v_positive: v >= 0
		do
			declared_inlining_size := v
		ensure
			inlining_size_declared: is_inlining_size_declared
			inlining_size_set: inlining_size = v
		end

	set_jumps_optimization (b: BOOLEAN)
			-- Set `jumps_optimization' to `b'.
		local
			l_declared_jumps_optimization: like declared_jumps_optimization
		do
			l_declared_jumps_optimization := declared_jumps_optimization
			if l_declared_jumps_optimization = Void then
				create l_declared_jumps_optimization.make_undefined
				declared_jumps_optimization := l_declared_jumps_optimization
			end
			if b then
				l_declared_jumps_optimization.set_true
			else
				l_declared_jumps_optimization.set_false
			end
		ensure
			jumps_optimization_declared: is_jumps_optimization_declared
			jumps_optimization_set: jumps_optimization = b
		end

	set_layout (a_value: STRING)
			-- Set `layout' to `a_value'.
		require
			a_value_valid: valid_layout.has (a_value)
		do
			declared_layout := a_value
		ensure
			layout_declared: is_layout_declared
			layout_set: layout = a_value
		end

	set_layout_optimization (b: BOOLEAN)
			-- Set `layout_optimization' to `b'.
		local
			l_declared_layout_optimization: like declared_layout_optimization
		do
			l_declared_layout_optimization := declared_layout_optimization
			if l_declared_layout_optimization = Void then
				create l_declared_layout_optimization.make_undefined
				declared_layout_optimization := l_declared_layout_optimization
			end
			if b then
				l_declared_layout_optimization.set_true
			else
				l_declared_layout_optimization.set_false
			end
		ensure
			layout_optimization_declared: is_layout_optimization_declared
			layout_optimization_set: layout_optimization = b
		end

	set_leaves_optimization (b: BOOLEAN)
			-- Set `leaves_optimization' to `b'.
		local
			l_declared_leaves_optimization: like declared_leaves_optimization
		do
			l_declared_leaves_optimization := declared_leaves_optimization
			if l_declared_leaves_optimization = Void then
				create l_declared_leaves_optimization.make_undefined
				declared_leaves_optimization := l_declared_leaves_optimization
			end
			if b then
				l_declared_leaves_optimization.set_true
			else
				l_declared_leaves_optimization.set_false
			end
		ensure
			leaves_optimization_declared: is_leaves_optimization_declared
			leaves_optimization_set: leaves_optimization = b
		end

	set_line_generation (b: BOOLEAN)
			-- Set `line_generation' to `b'.
		local
			l_declared_line_generation: like declared_line_generation
		do
			l_declared_line_generation := declared_line_generation
			if l_declared_line_generation = Void then
				create l_declared_line_generation.make_undefined
				declared_line_generation := l_declared_line_generation
			end
			if b then
				l_declared_line_generation.set_true
			else
				l_declared_line_generation.set_false
			end
		ensure
			line_generation_declared: is_line_generation_declared
			line_generation_set: line_generation = b
		end

	set_link (a_value: STRING)
			-- Set `link' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		local
			l_declared_link: like declared_link
		do
			l_declared_link := declared_link
			if l_declared_link = Void then
				create l_declared_link.make (10)
				l_declared_link.set_equality_tester (string_equality_tester)
				declared_link := l_declared_link
			end
			l_declared_link.force_last (a_value)
		ensure
			link_declared: is_link_declared
			link_set: link.has (a_value)
		end

	set_linker (a_value: STRING)
			-- Set `linker' to `a_value'.
		require
			a_value_valid: valid_linker.has (a_value)
		do
			declared_linker := a_value
		ensure
			linker_declared: is_linker_declared
			linker_set: linker = a_value
		end

	set_linux_fpu_double_precision (b: BOOLEAN)
			-- Set `linux_fpu_double_precision' to `b'.
		local
			l_declared_linux_fpu_double_precision: like declared_linux_fpu_double_precision
		do
			l_declared_linux_fpu_double_precision := declared_linux_fpu_double_precision
			if l_declared_linux_fpu_double_precision = Void then
				create l_declared_linux_fpu_double_precision.make_undefined
				declared_linux_fpu_double_precision := l_declared_linux_fpu_double_precision
			end
			if b then
				l_declared_linux_fpu_double_precision.set_true
			else
				l_declared_linux_fpu_double_precision.set_false
			end
		ensure
			linux_fpu_double_precision_declared: is_linux_fpu_double_precision_declared
			linux_fpu_double_precision_set: linux_fpu_double_precision = b
		end

	set_manifest_string_trace (b: BOOLEAN)
			-- Set `manifest_string_trace' to `b'.
		local
			l_declared_manifest_string_trace: like declared_manifest_string_trace
		do
			l_declared_manifest_string_trace := declared_manifest_string_trace
			if l_declared_manifest_string_trace = Void then
				create l_declared_manifest_string_trace.make_undefined
				declared_manifest_string_trace := l_declared_manifest_string_trace
			end
			if b then
				l_declared_manifest_string_trace.set_true
			else
				l_declared_manifest_string_trace.set_false
			end
		ensure
			manifest_string_trace_declared: is_manifest_string_trace_declared
			manifest_string_trace_set: manifest_string_trace = b
		end

	set_map (b: BOOLEAN)
			-- Set `map' to `b'.
		local
			l_declared_map: like declared_map
		do
			l_declared_map := declared_map
			if l_declared_map = Void then
				create l_declared_map.make_undefined
				declared_map := l_declared_map
			end
			if b then
				l_declared_map.set_true
			else
				l_declared_map.set_false
			end
		ensure
			map_declared: is_map_declared
			map_set: map = b
		end

	set_metadata_cache_path (a_value: STRING)
			-- Set `metadata_cache_path' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_metadata_cache_path := a_value
		ensure
			metadata_cache_path_declared: is_metadata_cache_path_declared
			metadata_cache_path_set: metadata_cache_path = a_value
		end

	set_msil_assembly_compatibility (a_value: STRING)
			-- Set `msil_assembly_compatibility' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_msil_assembly_compatibility := a_value
		ensure
			msil_assembly_compatibility_declared: is_msil_assembly_compatibility_declared
			msil_assembly_compatibility_set: msil_assembly_compatibility = a_value
		end

	set_msil_classes_per_module (v: INTEGER)
			-- Set `msil_classes_per_module' to `v'.
		require
			v_positive: v > 0
		do
			declared_msil_classes_per_module := v
		ensure
			msil_classes_per_module_declared: is_msil_classes_per_module_declared
			msil_classes_per_module_set: msil_classes_per_module = v
		end

	set_msil_clr_version (a_value: STRING)
			-- Set `msil_clr_version' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_msil_clr_version := a_value
		ensure
			msil_clr_version_declared: is_msil_clr_version_declared
			msil_clr_version_set: msil_clr_version = a_value
		end

	set_msil_culture (a_value: STRING)
			-- Set `msil_culture' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_msil_culture := a_value
		ensure
			msil_culture_declared: is_msil_culture_declared
			msil_culture_set: msil_culture = a_value
		end

	set_msil_generation (b: BOOLEAN)
			-- Set `msil_generation' to `b'.
		local
			l_declared_msil_generation: like declared_msil_generation
		do
			l_declared_msil_generation := declared_msil_generation
			if l_declared_msil_generation = Void then
				create l_declared_msil_generation.make_undefined
				declared_msil_generation := l_declared_msil_generation
			end
			if b then
				l_declared_msil_generation.set_true
			else
				l_declared_msil_generation.set_false
			end
		ensure
			msil_generation_declared: is_msil_generation_declared
			msil_generation_set: msil_generation = b
		end

	set_msil_generation_version (a_value: STRING)
			-- Set `msil_generation_version' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_msil_generation_version := a_value
		ensure
			msil_generation_version_declared: is_msil_generation_version_declared
			msil_generation_version_set: msil_generation_version = a_value
		end

	set_msil_key_file_name (a_value: STRING)
			-- Set `msil_key_file_name' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_msil_key_file_name := a_value
		ensure
			msil_key_file_name_declared: is_msil_key_file_name_declared
			msil_key_file_name_set: msil_key_file_name = a_value
		end

	set_msil_use_optimized_precompile (b: BOOLEAN)
			-- Set `msil_use_optimized_precompile' to `b'.
		local
			l_declared_msil_use_optimized_precompile: like declared_msil_use_optimized_precompile
		do
			l_declared_msil_use_optimized_precompile := declared_msil_use_optimized_precompile
			if l_declared_msil_use_optimized_precompile = Void then
				create l_declared_msil_use_optimized_precompile.make_undefined
				declared_msil_use_optimized_precompile := l_declared_msil_use_optimized_precompile
			end
			if b then
				l_declared_msil_use_optimized_precompile.set_true
			else
				l_declared_msil_use_optimized_precompile.set_false
			end
		ensure
			msil_use_optimized_precompile_declared: is_msil_use_optimized_precompile_declared
			msil_use_optimized_precompile_set: msil_use_optimized_precompile = b
		end

	set_multithreaded (b: BOOLEAN)
			-- Set `multithreaded' to `b'.
		local
			l_declared_multithreaded: like declared_multithreaded
		do
			l_declared_multithreaded := declared_multithreaded
			if l_declared_multithreaded = Void then
				create l_declared_multithreaded.make_undefined
				declared_multithreaded := l_declared_multithreaded
			end
			if b then
				l_declared_multithreaded.set_true
			else
				l_declared_multithreaded.set_false
			end
		ensure
			multithreaded_declared: is_multithreaded_declared
			multithreaded_set: multithreaded = b
		end

	set_namespace (a_value: STRING)
			-- Set `namespace' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_namespace := a_value
		ensure
			namespace_declared: is_namespace_declared
			namespace_set: namespace = a_value
		end

	set_no_default_lib (b: BOOLEAN)
			-- Set `no_default_lib' to `b'.
		local
			l_declared_no_default_lib: like declared_no_default_lib
		do
			l_declared_no_default_lib := declared_no_default_lib
			if l_declared_no_default_lib = Void then
				create l_declared_no_default_lib.make_undefined
				declared_no_default_lib := l_declared_no_default_lib
			end
			if b then
				l_declared_no_default_lib.set_true
			else
				l_declared_no_default_lib.set_false
			end
		ensure
			no_default_lib_declared: is_no_default_lib_declared
			no_default_lib_set: no_default_lib = b
		end

	set_old_verbatim_strings (b: BOOLEAN)
			-- Set `old_verbatim_strings' to `b'.
		local
			l_declared_old_verbatim_strings: like declared_old_verbatim_strings
		do
			l_declared_old_verbatim_strings := declared_old_verbatim_strings
			if l_declared_old_verbatim_strings = Void then
				create l_declared_old_verbatim_strings.make_undefined
				declared_old_verbatim_strings := l_declared_old_verbatim_strings
			end
			if b then
				l_declared_old_verbatim_strings.set_true
			else
				l_declared_old_verbatim_strings.set_false
			end
		ensure
			old_verbatim_strings_declared: is_old_verbatim_strings_declared
			old_verbatim_strings_set: old_verbatim_strings = b
		end

	set_override_cluster (a_value: STRING)
			-- Set `override_cluster' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		local
			l_declared_override_cluster: like declared_override_cluster
		do
			l_declared_override_cluster := declared_override_cluster
			if l_declared_override_cluster = Void then
				create l_declared_override_cluster.make (10)
				l_declared_override_cluster.set_equality_tester (string_equality_tester)
				declared_override_cluster := l_declared_override_cluster
			end
			l_declared_override_cluster.force_last (a_value)
		ensure
			override_cluster_declared: is_override_cluster_declared
			override_cluster_set: override_cluster.has (a_value)
		end

	set_portable_code_generation (b: BOOLEAN)
			-- Set `portable_code_generation' to `b'.
		local
			l_declared_portable_code_generation: like declared_portable_code_generation
		do
			l_declared_portable_code_generation := declared_portable_code_generation
			if l_declared_portable_code_generation = Void then
				create l_declared_portable_code_generation.make_undefined
				declared_portable_code_generation := l_declared_portable_code_generation
			end
			if b then
				l_declared_portable_code_generation.set_true
			else
				l_declared_portable_code_generation.set_false
			end
		ensure
			portable_code_generation_declared: is_portable_code_generation_declared
			portable_code_generation_set: portable_code_generation = b
		end

	set_precompiled (a_value: STRING)
			-- Set `precompiled' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_precompiled := a_value
		ensure
			precompiled_declared: is_precompiled_declared
			precompiled_set: precompiled = a_value
		end

	set_prefix_option (a_value: STRING)
			-- Set `prefix_option' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_prefix_option := a_value
		ensure
			prefix_option_declared: is_prefix_option_declared
			prefix_option_set: prefix_option = a_value
		end

	set_profile (b: BOOLEAN)
			-- Set `profile' to `b'.
		local
			l_declared_profile: like declared_profile
		do
			l_declared_profile := declared_profile
			if l_declared_profile = Void then
				create l_declared_profile.make_undefined
				declared_profile := l_declared_profile
			end
			if b then
				l_declared_profile.set_true
			else
				l_declared_profile.set_false
			end
		ensure
			profile_declared: is_profile_declared
			profile_set: profile = b
		end

	set_public_key_token (a_value: STRING)
			-- Set `public_key_token' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_public_key_token := a_value
		ensure
			public_key_token_declared: is_public_key_token_declared
			public_key_token_set: public_key_token = a_value
		end

	set_read_only (b: BOOLEAN)
			-- Set `read_only' to `b'.
		local
			l_declared_read_only: like declared_read_only
		do
			l_declared_read_only := declared_read_only
			if l_declared_read_only = Void then
				create l_declared_read_only.make_undefined
				declared_read_only := l_declared_read_only
			end
			if b then
				l_declared_read_only.set_true
			else
				l_declared_read_only.set_false
			end
		ensure
			read_only_declared: is_read_only_declared
			read_only_set: read_only = b
		end

	set_recursive (b: BOOLEAN)
			-- Set `recursive' to `b'.
		local
			l_declared_recursive: like declared_recursive
		do
			l_declared_recursive := declared_recursive
			if l_declared_recursive = Void then
				create l_declared_recursive.make_undefined
				declared_recursive := l_declared_recursive
			end
			if b then
				l_declared_recursive.set_true
			else
				l_declared_recursive.set_false
			end
		ensure
			recursive_declared: is_recursive_declared
			recursive_set: recursive = b
		end

	set_reloads_optimization (b: BOOLEAN)
			-- Set `reloads_optimization' to `b'.
		local
			l_declared_reloads_optimization: like declared_reloads_optimization
		do
			l_declared_reloads_optimization := declared_reloads_optimization
			if l_declared_reloads_optimization = Void then
				create l_declared_reloads_optimization.make_undefined
				declared_reloads_optimization := l_declared_reloads_optimization
			end
			if b then
				l_declared_reloads_optimization.set_true
			else
				l_declared_reloads_optimization.set_false
			end
		ensure
			reloads_optimization_declared: is_reloads_optimization_declared
			reloads_optimization_set: reloads_optimization = b
		end

	set_shared_library_definition (a_value: STRING)
			-- Set `shared_library_definition' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_shared_library_definition := a_value
		ensure
			shared_library_definition_declared: is_shared_library_definition_declared
			shared_library_definition_set: shared_library_definition = a_value
		end

	set_split (b: BOOLEAN)
			-- Set `split' to `b'.
		local
			l_declared_split: like declared_split
		do
			l_declared_split := declared_split
			if l_declared_split = Void then
				create l_declared_split.make_undefined
				declared_split := l_declared_split
			end
			if b then
				l_declared_split.set_true
			else
				l_declared_split.set_false
			end
		ensure
			split_declared: is_split_declared
			split_set: split = b
		end

	set_stack_size (v: INTEGER)
			-- Set `stack_size' to `v'.
		require
			v_positive: v >= 0
		do
			declared_stack_size := v
		ensure
			stack_size_declared: is_stack_size_declared
			stack_size_set: stack_size = v
		end

	set_storable (b: BOOLEAN)
			-- Set `storable' to `b'.
		local
			l_declared_storable: like declared_storable
		do
			l_declared_storable := declared_storable
			if l_declared_storable = Void then
				create l_declared_storable.make_undefined
				declared_storable := l_declared_storable
			end
			if b then
				l_declared_storable.set_true
			else
				l_declared_storable.set_false
			end
		ensure
			storable_declared: is_storable_declared
			storable_set: storable = b
		end

	set_storable_filename (a_value: STRING)
			-- Set `storable_filename' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_storable_filename := a_value
		ensure
			storable_filename_declared: is_storable_filename_declared
			storable_filename_set: storable_filename = a_value
		end

	set_strip_option (b: BOOLEAN)
			-- Set `strip_option' to `b'.
		local
			l_declared_strip_option: like declared_strip_option
		do
			l_declared_strip_option := declared_strip_option
			if l_declared_strip_option = Void then
				create l_declared_strip_option.make_undefined
				declared_strip_option := l_declared_strip_option
			end
			if b then
				l_declared_strip_option.set_true
			else
				l_declared_strip_option.set_false
			end
		ensure
			strip_option_declared: is_strip_option_declared
			strip_option_set: strip_option = b
		end

	set_syntax (a_value: STRING)
			-- Set `syntax' to `a_value'.
		require
			a_value_valid: valid_syntax.has (a_value)
		do
			declared_syntax := a_value
		ensure
			syntax_declared: is_syntax_declared
			syntax_set: target = a_value
		end

	set_target (a_value: STRING)
			-- Set `target' to `a_value'.
		require
			a_value_valid: valid_target.has (a_value)
		do
			declared_target := a_value
		ensure
			target_declared: is_target_declared
			target_set: target = a_value
		end

	set_trace (b: BOOLEAN)
			-- Set `trace' to `b'.
		local
			l_declared_trace: like declared_trace
		do
			l_declared_trace := declared_trace
			if l_declared_trace = Void then
				create l_declared_trace.make_undefined
				declared_trace := l_declared_trace
			end
			if b then
				l_declared_trace.set_true
			else
				l_declared_trace.set_false
			end
		ensure
			trace_declared: is_trace_declared
			trace_set: trace = b
		end

	set_use_cluster_name_as_namespace (b: BOOLEAN)
			-- Set `use_cluster_name_as_namespace' to `b'.
		local
			l_declared_use_cluster_name_as_namespace: like declared_use_cluster_name_as_namespace
		do
			l_declared_use_cluster_name_as_namespace := declared_use_cluster_name_as_namespace
			if l_declared_use_cluster_name_as_namespace = Void then
				create l_declared_use_cluster_name_as_namespace.make_undefined
				declared_use_cluster_name_as_namespace := l_declared_use_cluster_name_as_namespace
			end
			if b then
				l_declared_use_cluster_name_as_namespace.set_true
			else
				l_declared_use_cluster_name_as_namespace.set_false
			end
		ensure
			use_cluster_name_as_namespace_declared: is_use_cluster_name_as_namespace_declared
			use_cluster_name_as_namespace_set: use_cluster_name_as_namespace = b
		end

	set_use_full_cluster_name_as_namespace (b: BOOLEAN)
			-- Set `use_full_cluster_name_as_namespace' to `b'.
		local
			l_declared_use_full_cluster_name_as_namespace: like declared_use_full_cluster_name_as_namespace
		do
			l_declared_use_full_cluster_name_as_namespace := declared_use_full_cluster_name_as_namespace
			if l_declared_use_full_cluster_name_as_namespace = Void then
				create l_declared_use_full_cluster_name_as_namespace.make_undefined
				declared_use_full_cluster_name_as_namespace := l_declared_use_full_cluster_name_as_namespace
			end
			if b then
				l_declared_use_full_cluster_name_as_namespace.set_true
			else
				l_declared_use_full_cluster_name_as_namespace.set_false
			end
		ensure
			use_full_cluster_name_as_namespace_declared: is_use_full_cluster_name_as_namespace_declared
			use_full_cluster_name_as_namespace_set: use_full_cluster_name_as_namespace = b
		end

	set_verbose (b: BOOLEAN)
			-- Set `verbose' to `b'.
		local
			l_declared_verbose: like declared_verbose
		do
			l_declared_verbose := declared_verbose
			if l_declared_verbose = Void then
				create l_declared_verbose.make_undefined
				declared_verbose := l_declared_verbose
			end
			if b then
				l_declared_verbose.set_true
			else
				l_declared_verbose.set_false
			end
		ensure
			verbose_declared: is_verbose_declared
			verbose_set: verbose = b
		end

	set_version (a_value: STRING)
			-- Set `version' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_version := a_value
		ensure
			version_declared: is_version_declared
			version_set: version = a_value
		end

	set_visible_filename (a_value: STRING)
			-- Set `visible_filename' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_visible_filename := a_value
		ensure
			visible_filename_declared: is_visible_filename_declared
			visible_filename_set: visible_filename = a_value
		end

	set_void_safety (a_value: STRING)
			-- Set `void_safety' to `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_value_valid: valid_void_safety.has (a_value)
		do
			declared_void_safety := a_value
		ensure
			void_safety_declared: is_void_safety_declared
			void_safety_set: void_safety = a_value
		end

	set_warning (a_value: STRING)
			-- Set `warning' to `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_value_valid: valid_warning.has (a_value)
		do
			declared_warning := a_value
		ensure
			warning_declared: is_warning_declared
			warning_set: warning = a_value
		end

	set_wedit (b: BOOLEAN)
			-- Set `wedit' to `b'.
		local
			l_declared_wedit: like declared_wedit
		do
			l_declared_wedit := declared_wedit
			if l_declared_wedit = Void then
				create l_declared_wedit.make_undefined
				declared_wedit := l_declared_wedit
			end
			if b then
				l_declared_wedit.set_true
			else
				l_declared_wedit.set_false
			end
		ensure
			wedit_declared: is_wedit_declared
			wedit_set: wedit = b
		end

feature -- Status setting

	unset_abstract
			-- Unset `abstract'.
		do
			declared_abstract := Void
		ensure
			abstract_not_declared: not is_abstract_declared
		end

	unset_address_expression
			-- Unset `address_expression'.
		do
			declared_address_expression := Void
		ensure
			address_expression_not_declared: not is_address_expression_declared
		end

	unset_arguments
			-- Unset `arguments'.
		do
			declared_arguments := Void
		ensure
			arguments_not_declared: not is_arguments_declared
		end

	unset_array_optimization
			-- Unset `array_optimization'.
		do
			declared_array_optimization := Void
		ensure
			array_optimization_not_declared: not is_array_optimization_declared
		end

	unset_assembly
			-- Unset `assembly'.
		do
			declared_assembly := Void
		ensure
			assembly_not_declared: not is_assembly_declared
		end

	unset_assertion
			-- Unset `assertion'.
		do
			declared_assertion := Void
		ensure
			assertion_not_declared: not is_assertion_declared
		end

	unset_attached_by_default
			-- Unset 'attached_by_default'
		do
			declared_attached_by_default := Void
		ensure
			attached_by_default_not_declared: not is_attached_by_default_declared
		end

	unset_automatic_backup
			-- Unset `automatic_backup'.
		do
			declared_automatic_backup := Void
		ensure
			automatic_backup_not_declared: not is_automatic_backup_declared
		end

	unset_callback
			-- Unset `callback'.
		do
			declared_callback := Void
		ensure
			callback_not_declared: not is_callback_declared
		end

	unset_case_insensitive
			-- Unset `case_insensitive'.
		do
			declared_case_insensitive := Void
		ensure
			case_insensitive_not_declared: not is_case_insensitive_declared
		end

	unset_check_generic_creation_constraint
			-- Unset `check_generic_creation_constraint'.
		do
			declared_check_generic_creation_constraint := Void
		ensure
			check_generic_creation_constraint_not_declared: not is_check_generic_creation_constraint_declared
		end

	unset_check_vape
			-- Unset `check_vape'.
		do
			declared_check_vape := Void
		ensure
			check_vape_not_declared: not is_check_vape_declared
		end

	unset_clean
			-- Unset `clean'.
		do
			declared_clean := Void
		ensure
			clean_not_declared: not is_clean_declared
		end

	unset_cls_compliant
			-- Unset `cls_compliant'.
		do
			declared_cls_compliant := Void
		ensure
			cls_compliant_not_declared: not is_cls_compliant_declared
		end

	unset_component
			-- Unset `component'.
		do
			declared_component := Void
		ensure
			component_not_declared: not is_component_declared
		end

	unset_console_application
			-- Unset `console_application'.
		do
			declared_console_application := Void
		ensure
			console_application_not_declared: not is_console_application_declared
		end

	unset_create_keyword_extension
			-- Unset `create_keyword_extension'.
		do
			declared_create_keyword_extension := Void
		ensure
			create_keyword_extension_not_declared: not is_create_keyword_extension_declared
		end

	unset_culture
			-- Unset `culture'.
		do
			declared_culture := Void
		ensure
			culture_not_declared: not is_culture_declared
		end

	unset_c_compiler_options
			-- Unset `c_compiler_options'.
		do
			declared_c_compiler_options := Void
		ensure
			c_compiler_options_not_declared: not is_c_compiler_options_declared
		end

	unset_dead_code_removal
			-- Unset `dead_code_removal'.
		do
			declared_dead_code_removal := Void
		ensure
			dead_code_removal_not_declared: not is_dead_code_removal_declared
		end

	unset_debug_option
			-- Unset `debug_option'.
		do
			declared_debug_option := Void
		ensure
			debug_option_not_declared: not is_debug_option_declared
		end

	unset_debug_tag
			-- Unset `debug_tag'.
		do
			declared_debug_tag := Void
		ensure
			debug_tag_not_declared: not is_debug_tag_declared
		end

	unset_debugger
			-- Unset `debugger'.
		do
			declared_debugger := Void
		ensure
			debugger_not_declared: not is_debugger_declared
		end

	unset_document
			-- Unset `document'.
		do
			declared_document := Void
		ensure
			document_not_declared: not is_document_declared
		end

	unset_dotnet_naming_convention
			-- Unset `dotnet_naming_convention'.
		do
			declared_dotnet_naming_convention := Void
		ensure
			dotnet_naming_convention_not_declared: not is_dotnet_naming_convention_declared
		end

	unset_dynamic_runtime
			-- Unset `dynamic_runtime'.
		do
			declared_dynamic_runtime := Void
		ensure
			dynamic_runtime_not_declared: not is_dynamic_runtime_declared
		end

	unset_ecf_library
			-- Unset `ecf_library'.
		do
			declared_ecf_library := Void
		ensure
			ecf_library_not_declared: not is_ecf_library_declared
		end

	unset_enforce_unique_class_names
			-- Unset `enforce_unique_class_names'.
		do
			declared_enforce_unique_class_names := Void
		ensure
			enforce_unique_class_names_not_declared: not is_enforce_unique_class_names_declared
		end

	unset_exception_trace
			-- Unset `exception_trace'.
		do
			declared_exception_trace := Void
		ensure
			exception_trace_not_declared: not is_exception_trace_declared
		end

	unset_exclude
			-- Unset `exclude'.
		do
			declared_exclude := Void
		ensure
			exclude_not_declared: not is_exclude_declared
		end

	unset_export_option
			-- Unset `export_option'.
		do
			declared_export_option := Void
		ensure
			export_option_not_declared: not is_export_option_declared
		end

	unset_external_runtime
			-- Unset `external_runtime'.
		do
			declared_external_runtime := Void
		ensure
			external_runtime_not_declared: not is_external_runtime_declared
		end

	unset_finalize_option
			-- Unset `finalize_option'.
		do
			declared_finalize_option := Void
		ensure
			finalize_option_not_declared: not is_finalize_option_declared
		end

	unset_flat_fst_optimization
			-- Unset `flat_fst_optimization'.
		do
			declared_flat_fst_optimization := Void
		ensure
			flat_fst_optimization_not_declared: not is_flat_fst_optimization_declared
		end

	unset_force_32bits
			-- Unset `force_32bits'.
		do
			declared_force_32bits := Void
		ensure
			force_32bits_not_declared: not is_force_32bits_declared
		end

	unset_fst_expansion_factor
			-- Unset `fst_expansion_factor'.
		do
			declared_fst_expansion_factor := -1
		ensure
			fst_expansion_factor_not_declared: not is_fst_expansion_factor_declared
		end

	unset_fst_optimization
			-- Unset `fst_optimization'.
		do
			declared_fst_optimization := Void
		ensure
			fst_optimization_not_declared: not is_fst_optimization_declared
		end

	unset_full_class_checking
			-- Unset `full_class_checking'.
		do
			declared_full_class_checking := Void
		ensure
			full_class_checking_not_declared: not is_full_class_checking_declared
		end

	unset_garbage_collector
			-- Unset `garbage_collector'.
		do
			declared_garbage_collector := Void
		ensure
			garbage_collector_not_declared: not is_garbage_collector_declared
		end

	unset_gc_info
			-- Unset `gc_info'.
		do
			declared_gc_info := Void
		ensure
			gc_info_not_declared: not is_gc_info_declared
		end

	unset_heap_size
			-- Unset `heap_size'.
		do
			declared_heap_size := -1
		ensure
			heap_size_not_declared: not is_heap_size_declared
		end

	unset_header
			-- Unset `header'.
		do
			declared_header := Void
		ensure
			header_not_declared: not is_header_declared
		end

	unset_high_memory_compiler
			-- Unset `high_memory_compiler'.
		do
			declared_high_memory_compiler := Void
		ensure
			high_memory_compiler_not_declared: not is_high_memory_compiler_declared
		end

	unset_il_verifiable
			-- Unset `il_verifiable'.
		do
			declared_il_verifiable := Void
		ensure
			il_verifiable_not_declared: not is_il_verifiable_declared
		end

	unset_include
			-- Unset `include'.
		do
			declared_include := Void
		ensure
			include_not_declared: not is_include_declared
		end

	unset_inlining
			-- Unset `inlining'.
		do
			declared_inlining := Void
		ensure
			inlining_not_declared: not is_inlining_declared
		end

	unset_inlining_size
			-- Unset `inlining_size'.
		do
			declared_inlining_size := -1
		ensure
			inlining_size_not_declared: not is_inlining_size_declared
		end

	unset_jumps_optimization
			-- Unset `jumps_optimization'.
		do
			declared_jumps_optimization := Void
		ensure
			jumps_optimization_not_declared: not is_jumps_optimization_declared
		end

	unset_layout
			-- Unset `layout'.
		do
			declared_layout := Void
		ensure
			layout_not_declared: not is_layout_declared
		end

	unset_layout_optimization
			-- Unset `layout_optimization'.
		do
			declared_layout_optimization := Void
		ensure
			layout_optimization_not_declared: not is_layout_optimization_declared
		end

	unset_leaves_optimization
			-- Unset `leaves_optimization'.
		do
			declared_leaves_optimization := Void
		ensure
			leaves_optimization_not_declared: not is_leaves_optimization_declared
		end

	unset_line_generation
			-- Unset `line_generation'.
		do
			declared_line_generation := Void
		ensure
			line_generation_not_declared: not is_line_generation_declared
		end

	unset_link
			-- Unset `link'.
		do
			declared_link := Void
		ensure
			link_not_declared: not is_link_declared
		end

	unset_linker
			-- Unset `linker'.
		do
			declared_linker := Void
		ensure
			linker_not_declared: not is_linker_declared
		end

	unset_linux_fpu_double_precision
			-- Unset `linux_fpu_double_precision'.
		do
			declared_linux_fpu_double_precision := Void
		ensure
			linux_fpu_double_precision_not_declared: not is_linux_fpu_double_precision_declared
		end

	unset_manifest_string_trace
			-- Unset `manifest_string_trace'.
		do
			declared_manifest_string_trace := Void
		ensure
			manifest_string_trace_not_declared: not is_manifest_string_trace_declared
		end

	unset_map
			-- Unset `map'.
		do
			declared_map := Void
		ensure
			map_not_declared: not is_map_declared
		end

	unset_metadata_cache_path
			-- Unset `metadata_cache_path'.
		do
			declared_metadata_cache_path := Void
		ensure
			metadata_cache_path_not_declared: not is_metadata_cache_path_declared
		end

	unset_msil_assembly_compatibility
			-- Unset `msil_assembly_compatibility'.
		do
			declared_msil_assembly_compatibility := Void
		ensure
			msil_assembly_compatibility_not_declared: not is_msil_assembly_compatibility_declared
		end

	unset_msil_classes_per_module
			-- Unset `msil_classes_per_module'.
		do
			declared_msil_classes_per_module := -1
		ensure
			msil_classes_per_module_not_declared: not is_msil_classes_per_module_declared
		end

	unset_msil_clr_version
			-- Unset `msil_clr_version'.
		do
			declared_msil_clr_version := Void
		ensure
			msil_clr_version_not_declared: not is_msil_clr_version_declared
		end

	unset_msil_culture
			-- Unset `msil_culture'.
		do
			declared_msil_culture := Void
		ensure
			msil_culture_not_declared: not is_msil_culture_declared
		end

	unset_msil_generation
			-- Unset `msil_generation'.
		do
			declared_msil_generation := Void
		ensure
			msil_generation_not_declared: not is_msil_generation_declared
		end

	unset_msil_generation_version
			-- Unset `msil_generation_version'.
		do
			declared_msil_generation_version := Void
		ensure
			msil_generation_version_not_declared: not is_msil_generation_version_declared
		end

	unset_msil_key_file_name
			-- Unset `msil_key_file_name'.
		do
			declared_msil_key_file_name := Void
		ensure
			msil_key_file_name_not_declared: not is_msil_key_file_name_declared
		end

	unset_msil_use_optimized_precompile
			-- Unset `msil_use_optimized_precompile'.
		do
			declared_msil_use_optimized_precompile := Void
		ensure
			msil_use_optimized_precompile_not_declared: not is_msil_use_optimized_precompile_declared
		end

	unset_multithreaded
			-- Unset `multithreaded'.
		do
			declared_multithreaded := Void
		ensure
			multithreaded_not_declared: not is_multithreaded_declared
		end

	unset_namespace
			-- Unset `namespace'.
		do
			declared_namespace := Void
		ensure
			namespace_not_declared: not is_namespace_declared
		end

	unset_no_default_lib
			-- Unset `no_default_lib'.
		do
			declared_no_default_lib := Void
		ensure
			no_default_lib_not_declared: not is_no_default_lib_declared
		end

	unset_old_verbatim_strings
			-- Unset `old_verbatim_strings'.
		do
			declared_old_verbatim_strings := Void
		ensure
			old_verbatim_strings_not_declared: not is_old_verbatim_strings_declared
		end

	unset_override_cluster
			-- Unset `override_cluster'.
		do
			declared_override_cluster := Void
		ensure
			override_cluster_not_declared: not is_override_cluster_declared
		end

	unset_portable_code_generation
			-- Unset `portable_code_generation'.
		do
			declared_portable_code_generation := Void
		ensure
			portable_code_generation_not_declared: not is_portable_code_generation_declared
		end

	unset_precompiled
			-- Unset `precompiled'.
		do
			declared_precompiled := Void
		ensure
			precompiled_not_declared: not is_precompiled_declared
		end

	unset_prefix_option
			-- Unset `prefix_option'.
		do
			declared_prefix_option := Void
		ensure
			prefix_option_not_declared: not is_prefix_option_declared
		end

	unset_profile
			-- Unset `profile'.
		do
			declared_profile := Void
		ensure
			profile_not_declared: not is_profile_declared
		end

	unset_public_key_token
			-- Unset `public_key_token'.
		do
			declared_public_key_token := Void
		ensure
			public_key_token_not_declared: not is_public_key_token_declared
		end

	unset_read_only
			-- Unset `read_only'.
		do
			declared_read_only := Void
		ensure
			read_only_not_declared: not is_read_only_declared
		end

	unset_recursive
			-- Unset `recursive'.
		do
			declared_recursive := Void
		ensure
			recursive_not_declared: not is_recursive_declared
		end

	unset_reloads_optimization
			-- Unset `reloads_optimization'.
		do
			declared_reloads_optimization := Void
		ensure
			reloads_optimization_not_declared: not is_reloads_optimization_declared
		end

	unset_shared_library_definition
			-- Unset `shared_library_definition'.
		do
			declared_shared_library_definition := Void
		ensure
			shared_library_definition_not_declared: not is_shared_library_definition_declared
		end

	unset_split
			-- Unset `split'.
		do
			declared_split := Void
		ensure
			split_not_declared: not is_split_declared
		end

	unset_stack_size
			-- Unset `stack_size'.
		do
			declared_stack_size := -1
		ensure
			stack_size_not_declared: not is_stack_size_declared
		end

	unset_storable
			-- Unset `storable'.
		do
			declared_storable := Void
		ensure
			storable_not_declared: not is_storable_declared
		end

	unset_storable_filename
			-- Unset `storable_filename'.
		do
			declared_storable_filename := Void
		ensure
			storable_filename_not_declared: not is_storable_filename_declared
		end

	unset_strip_option
			-- Unset `strip_option'.
		do
			declared_strip_option := Void
		ensure
			strip_option_not_declared: not is_strip_option_declared
		end

	unset_syntax
			-- Unset `syntax'.
		do
			declared_syntax := Void
		ensure
			syntax_not_declared: not is_syntax_declared
		end

	unset_target
			-- Unset `target'.
		do
			declared_target := Void
		ensure
			target_not_declared: not is_target_declared
		end

	unset_trace
			-- Unset `trace'.
		do
			declared_trace := Void
		ensure
			trace_not_declared: not is_trace_declared
		end

	unset_use_cluster_name_as_namespace
			-- Unset `use_cluster_name_as_namespace'.
		do
			declared_use_cluster_name_as_namespace := Void
		ensure
			use_cluster_name_as_namespace_not_declared: not is_use_cluster_name_as_namespace_declared
		end

	unset_use_full_cluster_name_as_namespace
			-- Unset `use_full_cluster_name_as_namespace'.
		do
			declared_use_full_cluster_name_as_namespace := Void
		ensure
			use_full_cluster_name_as_namespace_not_declared: not is_use_full_cluster_name_as_namespace_declared
		end

	unset_verbose
			-- Unset `verbose'.
		do
			declared_verbose := Void
		ensure
			verbose_not_declared: not is_verbose_declared
		end

	unset_version
			-- Unset `version'.
		do
			declared_version := Void
		ensure
			version_not_declared: not is_version_declared
		end

	unset_visible_filename
			-- Unset `visible_filename'.
		do
			declared_visible_filename := Void
		ensure
			visible_filename_not_declared: not is_visible_filename_declared
		end

	unset_void_safety
			-- Unset 'void_safety'
		do
			declared_void_safety := Void
		ensure
			void_safety_not_declared: not is_void_safety_declared
		end
	unset_warning
			-- Unset `warning'.
		do
			declared_warning := Void
		ensure
			warning_not_declared: not is_warning_declared
		end

	unset_wedit
			-- Unset `wedit'.
		do
			declared_wedit := Void
		ensure
			wedit_not_declared: not is_wedit_declared
		end

feature -- Valid values

	valid_assertion: DS_HASH_SET [STRING]
			-- Valid values for 'assertion' option
		once
			create Result.make (10)
			Result.set_equality_tester (string_equality_tester)
			Result.put_last (options.none_value)
			Result.put_last (options.generate_value)
			Result.put_last (options.require_value)
			Result.put_last (options.supplier_precondition_value)
			Result.put_last (options.ensure_value)
			Result.put_last (options.invariant_value)
			Result.put_last (options.loop_invariant_value)
			Result.put_last (options.loop_variant_value)
			Result.put_last (options.check_value)
			Result.put_last (options.all_value)
		ensure
			valid_assertion_not_void: Result /= Void
			valid_assertion_not_empty: not Result.is_empty
			no_void_value: not Result.has_void
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_callback: DS_HASH_SET [STRING]
			-- Valid values for 'callback' option
		once
			create Result.make (1)
			Result.set_equality_tester (string_equality_tester)
			Result.put_last (options.winapi_value)
		ensure
			valid_assertion_not_void: Result /= Void
			valid_assertion_not_empty: not Result.is_empty
			no_void_value: not Result.has_void
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_dead_code_removal: DS_HASH_SET [STRING]
			-- Valid values for 'dead_code_removal' option
		once
			create Result.make (5)
			Result.set_equality_tester (string_equality_tester)
			Result.put_last (options.none_value)
			Result.put_last (options.low_level_value)
			Result.put_last (options.feature_value)
			Result.put_last (options.class_value)
			Result.put_last (options.all_value)
		ensure
			valid_dead_code_removal_not_void: Result /= Void
			valid_dead_code_removal_not_empty: not Result.is_empty
			no_void_value: not Result.has_void
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_garbage_collector: DS_HASH_SET [STRING]
			-- Valid values for 'garbage_collector' option
		once
			create Result.make (3)
			Result.set_equality_tester (string_equality_tester)
			Result.put_last (options.none_value)
			Result.put_last (options.internal_value)
			Result.put_last (options.boehm_value)
		ensure
			valid_garbage_collector_not_void: Result /= Void
			valid_garbage_collector_not_empty: not Result.is_empty
			no_void_value: not Result.has_void
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_inlining: DS_HASH_SET [STRING]
			-- Valid values for 'inlining' option
		once
			create Result.make (5)
			Result.set_equality_tester (string_equality_tester)
			Result.put_last (options.none_value)
			Result.put_last (options.array_value)
			Result.put_last (options.constant_value)
			Result.put_last (options.once_value)
			Result.put_last (options.all_value)
		ensure
			valid_inlining_not_void: Result /= Void
			valid_inlining_not_empty: not Result.is_empty
			no_void_value: not Result.has_void
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_layout: DS_HASH_SET [STRING]
			-- Valid values for 'layout' option
		once
			create Result.make (2)
			Result.set_equality_tester (string_equality_tester)
			Result.put_last (options.auto_value)
			Result.put_last (options.sequential_value)
		ensure
			valid_layout_not_void: Result /= Void
			valid_layout_not_empty: not Result.is_empty
			no_void_value: not Result.has_void
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_linker: DS_HASH_SET [STRING]
			-- Valid values for 'linker' option
		once
			create Result.make (2)
			Result.set_equality_tester (string_equality_tester)
			Result.put_last (options.default_value)
			Result.put_last (options.microsoft_value)
		ensure
			valid_linker_not_void: Result /= Void
			valid_linker_not_empty: not Result.is_empty
			no_void_value: not Result.has_void
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_syntax: DS_HASH_SET [STRING]
			-- Valid values for 'syntax' option
		once
			create Result.make (3)
			Result.set_equality_tester (string_equality_tester)
			Result.put_last (options.obsolete_value)
			Result.put_last (options.transitional_value)
			Result.put_last (options.standard_value)
		ensure
			valid_syntax_not_void: Result /= Void
			valid_syntax_not_empty: not Result.is_empty
			no_void_value: not Result.has_void
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_target: DS_HASH_SET [STRING]
			-- Valid values for 'target' option
		once
			create Result.make (4)
			Result.set_equality_tester (string_equality_tester)
			Result.put_last (options.exe_value)
			Result.put_last (options.dll_value)
			Result.put_last (options.com_value)
			Result.put_last (options.no_main_value)
		ensure
			valid_target_not_void: Result /= Void
			valid_target_not_empty: not Result.is_empty
			no_void_value: not Result.has_void
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_unicode: DS_HASH_SET [STRING]
			-- Valid values for 'unicode' option
		once
			create Result.make (2)
			Result.set_equality_tester (string_equality_tester)
			Result.put_last (options.none_value)
			Result.put_last (options.utf8_value)
		ensure
			valid_target_not_void: Result /= Void
			valid_target_not_empty: not Result.is_empty
			no_void_value: not Result.has_void
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_void_safety: DS_HASH_SET [STRING]
			-- Valid values for 'void_safety' option
		once
			create Result.make (3)
			Result.set_equality_tester (string_equality_tester)
			Result.put_last (options.none_value)
			Result.put_last (options.on_demand_value)
			Result.put_last (options.complete_value)
		ensure
			valid_target_not_void: Result /= Void
			valid_target_not_empty: not Result.is_empty
			no_void_value: not Result.has_void
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_warning: DS_HASH_SET [STRING]
			-- Valid values for 'warning' option
		once
			create Result.make (4)
			Result.set_equality_tester (string_equality_tester)
			Result.put_last (options.none_value)
			Result.put_last (options.style_value)
			Result.put_last (options.default_value)
			Result.put_last (options.all_value)
		ensure
			valid_warning_not_void: Result /= Void
			valid_warning_not_empty: not Result.is_empty
			no_void_value: not Result.has_void
			-- all_lower: forall v in Result, v.is_lower
		end

feature -- Declared values

	declared_abstract: detachable UT_TRISTATE
			-- Declared value for 'abstract' option

	declared_address_expression: detachable UT_TRISTATE
			-- Declared value for 'address_expression' option

	declared_arguments: detachable DS_HASH_SET [STRING]
			-- Declared values for 'arguments' option

	declared_array_optimization: detachable UT_TRISTATE
			-- Declared value for 'array_optimization' option

	declared_assembly: detachable STRING
			-- Declared value for 'assembly' option

	declared_assertion: detachable DS_HASH_SET [STRING]
			-- Declared values for 'assertion' option

	declared_attached_by_default: detachable UT_TRISTATE
			-- Declared value for 'attached_by_default' option

	declared_automatic_backup: detachable UT_TRISTATE
			-- Declared value for 'automatic_backup' option

	declared_callback: detachable STRING
			-- Declared value for 'callback' option

	declared_case_insensitive: detachable UT_TRISTATE
			-- Declared value for 'case_insensitive' option

	declared_check_generic_creation_constraint: detachable UT_TRISTATE
			-- Declared value for 'check_generic_creation_constraint' option

	declared_check_vape: detachable UT_TRISTATE
			-- Declared value for 'check_vape' option

	declared_clean: detachable UT_TRISTATE
			-- Declared value for 'clean' option

	declared_cls_compliant: detachable UT_TRISTATE
			-- Declared value for 'cls_compliant' option

	declared_component: detachable STRING
			-- Declared value for 'component' option

	declared_console_application: detachable UT_TRISTATE
			-- Declared value for 'console_application' option

	declared_create_keyword_extension: detachable UT_TRISTATE
			-- Declared value for 'create_keyword_extension' option

	declared_culture: detachable STRING
			-- Declared value for 'culture' option

	declared_c_compiler_options: detachable DS_HASH_SET [STRING]
			-- Declared values for 'c_compiler_options' option

	declared_dead_code_removal: detachable DS_HASH_SET [STRING]
			-- Declared values for 'dead_code_removal' option

	declared_debug_option: detachable UT_TRISTATE
			-- Declared value for 'debug' option

	declared_debug_tag: detachable DS_HASH_SET [STRING]
			-- Declared values for 'debug_tag' option

	declared_debugger: detachable UT_TRISTATE
			-- Declared value for 'debugger' option

	declared_document: detachable STRING
			-- Declared value for 'document' option

	declared_dotnet_naming_convention: detachable UT_TRISTATE
			-- Declared value for 'dotnet_naming_convention' option

	declared_dynamic_runtime: detachable UT_TRISTATE
			-- Declared value for 'dynamic_runtime' option

	declared_ecf_library: detachable STRING
			-- Declared value for 'ecf_library' option

	declared_enforce_unique_class_names: detachable UT_TRISTATE
			-- Declared value for 'enforce_unique_class_names' option

	declared_exception_trace: detachable UT_TRISTATE
			-- Declared value for 'exception_trace' option

	declared_exclude: detachable DS_HASH_SET [STRING]
			-- Declared values for 'exclude' option

	declared_export_option: detachable STRING
			-- Declared value for 'export' option

	declared_external_runtime: detachable STRING
			-- Declared value for 'external_runtime' option

	declared_finalize_option: detachable UT_TRISTATE
			-- Declared value for 'finalize' option

	declared_flat_fst_optimization: detachable UT_TRISTATE
			-- Declared value for 'flat_fst_optimization' option

	declared_force_32bits: detachable UT_TRISTATE
			-- Declared value for 'force_32bits' option

	declared_fst_expansion_factor: detachable INTEGER
			-- Declared value for 'fst_expansion_factor' option

	declared_fst_optimization: detachable UT_TRISTATE
			-- Declared value for 'fst_optimization' option

	declared_full_class_checking: detachable UT_TRISTATE
			-- Declared value for 'full_class_checking' option

	declared_garbage_collector: detachable STRING
			-- Declared value for 'garbage_collector' option

	declared_gc_info: detachable UT_TRISTATE
			-- Declared value for 'gc_info' option

	declared_heap_size: detachable INTEGER
			-- Declared value for 'heap_size' option

	declared_header: detachable DS_HASH_SET [STRING]
			-- Declared values for 'header' option

	declared_high_memory_compiler: detachable UT_TRISTATE
			-- Declared value for 'high_memory_compiler' option

	declared_il_verifiable: detachable UT_TRISTATE
			-- Declared value for 'il_verifiable' option

	declared_include: detachable DS_HASH_SET [STRING]
			-- Declared values for 'include' option

	declared_inlining: detachable DS_HASH_SET [STRING]
			-- Declared values for 'inlining' option

	declared_inlining_size: INTEGER
			-- Declared value for 'inlining_size' option

	declared_jumps_optimization: detachable UT_TRISTATE
			-- Declared value for 'jumps_optimization' option

	declared_layout: detachable STRING
			-- Declared value for 'layout' option

	declared_layout_optimization: detachable UT_TRISTATE
			-- Declared value for 'layout_optimization' option

	declared_leaves_optimization: detachable UT_TRISTATE
			-- Declared value for 'leaves_optimization' option

	declared_line_generation: detachable UT_TRISTATE
			-- Declared value for 'line_generation' option

	declared_link: detachable DS_ARRAYED_LIST [STRING]
			-- Declared values for 'link' option

	declared_linker: detachable STRING
			-- Declared value for 'linker' option

	declared_linux_fpu_double_precision: detachable UT_TRISTATE
			-- Declared value for 'linux_fpu_double_precision' option

	declared_manifest_string_trace: detachable UT_TRISTATE
			-- Declared value for 'manifest_string_trace' option

	declared_map: detachable UT_TRISTATE
			-- Declared value for 'map' option

	declared_metadata_cache_path: detachable STRING
			-- Declared value for 'metadata_cache_path' option

	declared_msil_assembly_compatibility: detachable STRING
			-- Declared value for 'msil_assembly_compatibility' option

	declared_msil_classes_per_module: INTEGER
			-- Declared value for 'msil_classes_per_module' option

	declared_msil_clr_version: detachable STRING
			-- Declared value for 'msil_clr_version' option

	declared_msil_culture: detachable STRING
			-- Declared value for 'msil_culture' option

	declared_msil_generation: detachable UT_TRISTATE
			-- Declared value for 'msil_generation' option

	declared_msil_generation_version: detachable STRING
			-- Declared value for 'msil_generation_version' option

	declared_msil_key_file_name: detachable STRING
			-- Declared value for 'msil_key_file_name' option

	declared_msil_use_optimized_precompile: detachable UT_TRISTATE
			-- Declared value for 'msil_use_optimized_precompile' option

	declared_multithreaded: detachable UT_TRISTATE
			-- Declared value for 'multithreaded' option

	declared_namespace: detachable STRING
			-- Declared value for 'namespace' option

	declared_no_default_lib: detachable UT_TRISTATE
			-- Declared value for 'no_default_lib' option

	declared_old_verbatim_strings: detachable UT_TRISTATE
			-- Declared value for 'old_verbatim_strings' option

	declared_override_cluster: detachable DS_HASH_SET [STRING]
			-- Declared value for 'override_cluster' option

	declared_portable_code_generation: detachable UT_TRISTATE
			-- Declared value for 'portable_code_generation' option

	declared_precompiled: detachable STRING
			-- Declared value for 'precompiled' option

	declared_prefix_option: detachable STRING
			-- Declared value for 'prefix' option

	declared_profile: detachable UT_TRISTATE
			-- Declared value for 'profile' option

	declared_public_key_token: detachable STRING
			-- Declared value for 'public_key_token' option

	declared_read_only: detachable UT_TRISTATE
			-- Declared value for 'read_only' option

	declared_recursive: detachable UT_TRISTATE
			-- Declared value for 'recursive' option

	declared_reloads_optimization: detachable UT_TRISTATE
			-- Declared value for 'reloads_optimization' option

	declared_shared_library_definition: detachable STRING
			-- Declared value for 'shared_library_definition' option

	declared_split: detachable UT_TRISTATE
			-- Declared value for 'split' option

	declared_stack_size: INTEGER
			-- Declared value for 'stack_size' option

	declared_storable: detachable UT_TRISTATE
			-- Declared value for 'storable' option

	declared_storable_filename: detachable STRING
			-- Declared value for 'storable_filename' option

	declared_strip_option: detachable UT_TRISTATE
			-- Declared value for 'strip' option

	declared_syntax: detachable STRING
			-- Declared value for 'syntax' option

	declared_target: detachable STRING
			-- Declared value for 'target' option

	declared_trace: detachable UT_TRISTATE
			-- Declared value for 'trace' option

	declared_use_cluster_name_as_namespace: detachable UT_TRISTATE
			-- Declared value for 'use_cluster_name_as_namespace' option

	declared_use_full_cluster_name_as_namespace: detachable UT_TRISTATE
			-- Declared value for 'use_full_cluster_name_as_namespace' option

	declared_verbose: detachable UT_TRISTATE
			-- Declared value for 'verbose' option

	declared_version: detachable STRING
			-- Declared value for 'version' option

	declared_visible_filename: detachable STRING
			-- Declared value for 'visible_filename' option

	declared_void_safety: detachable STRING
			-- Declared value for 'void_safety' option

	declared_warning: detachable STRING
			-- Declared value for 'warning' option

	declared_wedit: detachable UT_TRISTATE
			-- Declared value for 'wedit' option

feature -- Default values

	default_abstract: BOOLEAN = False
			-- Default value for 'abstract' option

	default_address_expression: BOOLEAN = False
			-- Default value for 'address_expression' option

	default_arguments: DS_HASH_SET [STRING]
			-- Default value for 'arguments' option
		once
			create Result.make (0)
			Result.set_equality_tester (string_equality_tester)
		ensure
			default_arguments_not_void: Result /= Void
			no_void_argument: not Result.has_void
		end

	default_array_optimization: BOOLEAN = False
			-- Default value for 'array_optimization' option

	default_assembly: detachable STRING
			-- Default value for 'assembly' option
		once
			Result := Void
		end

	default_assertion: DS_HASH_SET [STRING]
			-- Default value for 'assertion' option
		once
			create Result.make (1)
			Result.set_equality_tester (string_equality_tester)
			Result.put_new (options.require_value)
		ensure
			default_assertion_not_void: Result /= Void
			-- valid_value: forall v in Result, valid_assertion.has (v)
		end

	default_attached_by_default: BOOLEAN = False
			-- Default value for 'attached_by_default' option

	default_automatic_backup: BOOLEAN = False
			-- Default value for 'automatic_backup' option

	default_callback: detachable STRING
			-- Default value for 'callback' option
		once
			Result := Void
		ensure
			valid_default_callback: Result /= Void implies valid_callback.has (Result)
		end

	default_case_insensitive: BOOLEAN = True
			-- Default value for 'case_insensitive' option

	default_check_generic_creation_constraint: BOOLEAN = True
			-- Default value for 'check_generic_creation_constraint' option

	default_check_vape: BOOLEAN = True
			-- Default value for 'check_vape' option

	default_clean: BOOLEAN = False
			-- Default value for 'clean' option

	default_cls_compliant: BOOLEAN = True
			-- Default value for 'cls_compliant' option

	default_component: detachable STRING
			-- Default value for 'component' option
		once
			Result := Void
		end

	default_console_application: BOOLEAN = True
			-- Default value for 'console_application' option

	default_create_keyword_extension: BOOLEAN = True
			-- Default value for 'create_keyword_extension' option

	default_culture: STRING
			-- Default value for 'culture' option
		once
			Result := "neutral"
		end

	default_c_compiler_options: DS_HASH_SET [STRING]
			-- Default value for 'c_compiler_options' option
		once
			create Result.make (0)
			Result.set_equality_tester (string_equality_tester)
		ensure
			default_c_compiler_options_not_void: Result /= Void
			no_void_c_compiler_option: not Result.has_void
		end

	default_dead_code_removal: DS_HASH_SET [STRING]
			-- Default value for 'dead_code_removal' option
		once
			create Result.make (1)
			Result.set_equality_tester (string_equality_tester)
			Result.put_new (options.all_value)
		ensure
			default_dead_code_removal_not_void: Result /= Void
			-- valid_value: forall v in Result, valid_dead_code_removal.has (v)
		end

	default_debug_option: BOOLEAN = False
			-- Default value for 'debug' option

	default_debug_tag: DS_HASH_SET [STRING]
			-- Default value for 'debug_tag' option
		once
			create Result.make (0)
			Result.set_equality_tester (string_equality_tester)
		ensure
			default_debug_tag_not_void: Result /= Void
			no_void_debug_tag: not Result.has_void
		end

	default_debugger: BOOLEAN = False
			-- Default value for 'debugger' option

	default_document: detachable STRING
			-- Default value for 'document' option
		once
			Result := Void
		end

	default_dotnet_naming_convention: BOOLEAN = False
			-- Default value for 'dotnet_naming_convention' option

	default_dynamic_runtime: BOOLEAN = False
			-- Default value for 'dynamic_runtime' option

	default_ecf_library: detachable STRING
			-- Default value for 'ecf_library' option
		once
			Result := Void
		end

	default_enforce_unique_class_names: BOOLEAN = False
			-- Default value for 'enforce_unique_class_names' option

	default_exception_trace: BOOLEAN = False
			-- Default value for 'exception_trace' option

	default_exclude: DS_HASH_SET [STRING]
			-- Default value for 'exclude' option
		once
			create Result.make (0)
			Result.set_equality_tester (string_equality_tester)
		ensure
			default_exclude_not_void: Result /= Void
			no_void_exclude: not Result.has_void
		end

	default_export_option: detachable STRING
			-- Default value for 'export' option
		once
			Result := Void
		end

	default_external_runtime: detachable STRING
			-- Default value for 'external_runtime' option
		once
			Result := Void
		end

	default_finalize_option: BOOLEAN = False
			-- Default value for 'finalize' option

	default_flat_fst_optimization: BOOLEAN = False
			-- Default value for 'flat_fst_optimization' option

	default_force_32bits: BOOLEAN = False
			-- Default value for 'force_32bits' option

	default_fst_expansion_factor: INTEGER = 2
			-- Default value for 'fst_expansion_factor' option

	default_fst_optimization: BOOLEAN = False
			-- Default value for 'fst_optimization' option

	default_full_class_checking: BOOLEAN = False
			-- Default value for 'full_class_checking' option

	default_garbage_collector: STRING
			-- Default value for 'garbage_collector' option
		once
			Result := options.internal_value
		ensure
			valid_default_garbage_collector: valid_garbage_collector.has (Result)
		end

	default_gc_info: BOOLEAN = False
			-- Default value for 'gc_info' option

	default_heap_size: INTEGER = -1
			-- Default value for 'heap_size' option

	default_header: DS_HASH_SET [STRING]
			-- Default value for 'header' option
		once
			create Result.make (0)
			Result.set_equality_tester (string_equality_tester)
		ensure
			default_header_not_void: Result /= Void
			no_void_header: not Result.has_void
		end

	default_high_memory_compiler: BOOLEAN = False
			-- Default value for 'high_memory_compiler' option

	default_il_verifiable: BOOLEAN = True
			-- Default value for 'il_verifiable' option

	default_include: DS_HASH_SET [STRING]
			-- Default value for 'include' option
		once
			create Result.make (0)
			Result.set_equality_tester (string_equality_tester)
		ensure
			default_include_not_void: Result /= Void
			no_void_include: not Result.has_void
		end

	default_inlining: DS_HASH_SET [STRING]
			-- Default value for 'inlining' option
		once
			create Result.make (1)
			Result.set_equality_tester (string_equality_tester)
			Result.put_new (options.all_value)
		ensure
			default_inlining_not_void: Result /= Void
			-- valid_value: forall v in Result, valid_inlining.has (v)
		end

	default_inlining_size: INTEGER = 0
			-- Default value for 'inlining_size' option

	default_jumps_optimization: BOOLEAN = False
			-- Default value for 'jumps_optimization' option

	default_layout: STRING
			-- Default value for 'layout' option
		once
			Result := options.auto_value
		ensure
			valid_default_layout: valid_layout.has (Result)
		end

	default_layout_optimization: BOOLEAN = False
			-- Default value for 'layout_optimization' option

	default_leaves_optimization: BOOLEAN = False
			-- Default value for 'leaves_optimization' option

	default_line_generation: BOOLEAN = False
			-- Default value for 'line_generation' option

	default_link: DS_ARRAYED_LIST [STRING]
			-- Default value for 'link' option
		once
			create Result.make (0)
			Result.set_equality_tester (string_equality_tester)
		ensure
			default_link_not_void: Result /= Void
			no_void_link: not Result.has_void
		end

	default_linker: STRING
			-- Default value for 'linker' option
		once
			Result := options.default_value
		ensure
			valid_default_linker: valid_linker.has (Result)
		end

	default_linux_fpu_double_precision: BOOLEAN = False
			-- Default value for 'linux_fpu_double_precision' option

	default_manifest_string_trace: BOOLEAN = False
			-- Default value for 'manifest_string_trace' option

	default_map: BOOLEAN = False
			-- Default value for 'map' option

	default_metadata_cache_path: detachable STRING
			-- Default value for 'metadata_cache_path' option
		once
			Result := Void
		end

	default_msil_assembly_compatibility: detachable STRING
			-- Default value for 'msil_assembly_compatibility' option
		once
			Result := Void
		end

	default_msil_classes_per_module: INTEGER = 5
			-- Default value for 'msil_classes_per_module' option

	default_msil_clr_version: detachable STRING
			-- Default value for 'msil_clr_version' option
		once
			Result := Void
		end

	default_msil_culture: detachable STRING
			-- Default value for 'msil_culture' option
		once
			Result := Void
		end

	default_msil_generation: BOOLEAN = False
			-- Default value for 'msil_generation' option

	default_msil_generation_version: detachable STRING
			-- Default value for 'msil_generation_version' option
		once
			Result := Void
		end

	default_msil_key_file_name: detachable STRING
			-- Default value for 'msil_key_file_name' option
		once
			Result := Void
		end

	default_msil_use_optimized_precompile: BOOLEAN = False
			-- Default value for 'msil_use_optimized_precompile' option

	default_multithreaded: BOOLEAN = False
			-- Default value for 'multithreaded' option

	default_namespace: detachable STRING
			-- Default value for 'namespace' option
		once
			Result := Void
		end

	default_no_default_lib: BOOLEAN = False
			-- Default value for 'no_default_lib' option

	default_old_verbatim_strings: BOOLEAN = False
			-- Default value for 'old_verbatim_strings' option

	default_override_cluster: DS_HASH_SET [STRING]
			-- Default value for 'override_cluster' option
		once
			create Result.make (0)
			Result.set_equality_tester (string_equality_tester)
		ensure
			default_override_cluster_not_void: Result /= Void
			no_void_override_cluster: not Result.has_void
		end

	default_portable_code_generation: BOOLEAN = False
			-- Default value for 'portable_code_generation' option

	default_precompiled: detachable STRING
			-- Default value for 'precompiled' option
		once
			Result := Void
		end

	default_prefix_option: detachable STRING
			-- Default value for 'prefix' option
		once
			Result := Void
		end

	default_profile: BOOLEAN = False
			-- Default value for 'profile' option

	default_public_key_token: STRING
			-- Default value for 'public_key_token' option
		once
			Result := "b77a5c561934e089"
		end

	default_read_only: BOOLEAN = False
			-- Default value for 'read_only' option

	default_recursive: BOOLEAN = False
			-- Default value for 'recursive' option

	default_reloads_optimization: BOOLEAN = False
			-- Default value for 'reloads_optimization' option

	default_shared_library_definition: detachable STRING
			-- Default value for 'shared_library_definition' option
		once
			Result := Void
		end

	default_split: BOOLEAN = False
			-- Default value for 'split' option

	default_stack_size: INTEGER = -1
			-- Default value for 'stack_size' option

	default_storable: BOOLEAN = False
			-- Default value for 'storable' option

	default_storable_filename: detachable STRING
			-- Default value for 'storable_filename' option
		once
			Result := Void
		end

	default_strip_option: BOOLEAN = True
			-- Default value for 'strip' option

	default_syntax: STRING
			-- Default value for 'syntax' option
		once
			Result := options.transitional_value
		ensure
			valid_default_syntax: valid_syntax.has (Result)
		end

	default_target: STRING
			-- Default value for 'target' option
		once
			Result := options.exe_value
		ensure
			valid_default_target: valid_target.has (Result)
		end

	default_target_architecture: detachable STRING
			-- Default value for 'target_architecture' option
		once
			Result := Void
		end

	default_target_os: detachable STRING
			-- Default value for 'target_os' option
		once
			Result := Void
		end

	default_trace: BOOLEAN = False
			-- Default value for 'trace' option

	default_unicode: STRING
			-- Default value for 'unicode' option
		once
			Result := options.none_value
		ensure
			valid_default_unicode: valid_unicode.has (Result)
		end

	default_use_cluster_name_as_namespace: BOOLEAN = False
			-- Default value for 'use_cluster_name_as_namespace' option

	default_use_full_cluster_name_as_namespace: BOOLEAN = False
			-- Default value for 'use_full_cluster_name_as_namespace' option

	default_verbose: BOOLEAN = False
			-- Default value for 'verbose' option

	default_version: STRING
			-- Default value for 'version' option
		once
			Result := "1.0.5000.0"
		end

	default_visible_filename: detachable STRING
			-- Default value for 'visible_filename' option
		once
			Result := Void
		end

	default_void_safety : STRING
			-- Default value for 'void_safety' option
		once
			Result := options.none_value
		end

	default_warning: STRING
			-- Default value for 'warning' option
		once
			Result := options.default_value
		ensure
			valid_default_warning: valid_warning.has (Result)
		end

	default_wedit: BOOLEAN = False
			-- Default value for 'wedit' option

end
