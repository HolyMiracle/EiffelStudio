indexing
	Generator: "Eiffel Emitter 2.7b2"
	external_name: "System.Runtime.InteropServices.IRegistrationServices"

deferred external class
	SYSTEM_RUNTIME_INTEROPSERVICES_IREGISTRATIONSERVICES

inherit
	ANY
		undefine
			finalize,
			get_hash_code,
			is_equal,
			to_string
		end

feature -- Basic Operations

	register_type_for_com_clients (type: SYSTEM_TYPE; g: SYSTEM_GUID) is
		external
			"IL deferred signature (System.Type, System.Guid&): System.Void use System.Runtime.InteropServices.IRegistrationServices"
		alias
			"RegisterTypeForComClients"
		end

	get_prog_id_for_type (type: SYSTEM_TYPE): STRING is
		external
			"IL deferred signature (System.Type): System.String use System.Runtime.InteropServices.IRegistrationServices"
		alias
			"GetProgIdForType"
		end

	get_managed_category_guid: SYSTEM_GUID is
		external
			"IL deferred signature (): System.Guid use System.Runtime.InteropServices.IRegistrationServices"
		alias
			"GetManagedCategoryGuid"
		end

	get_registrable_types_in_assembly (assembly: SYSTEM_REFLECTION_ASSEMBLY): ARRAY [SYSTEM_TYPE] is
		external
			"IL deferred signature (System.Reflection.Assembly): System.Type[] use System.Runtime.InteropServices.IRegistrationServices"
		alias
			"GetRegistrableTypesInAssembly"
		end

	type_represents_com_type (type: SYSTEM_TYPE): BOOLEAN is
		external
			"IL deferred signature (System.Type): System.Boolean use System.Runtime.InteropServices.IRegistrationServices"
		alias
			"TypeRepresentsComType"
		end

	type_requires_registration (type: SYSTEM_TYPE): BOOLEAN is
		external
			"IL deferred signature (System.Type): System.Boolean use System.Runtime.InteropServices.IRegistrationServices"
		alias
			"TypeRequiresRegistration"
		end

	register_assembly (assembly: SYSTEM_REFLECTION_ASSEMBLY; flags: SYSTEM_RUNTIME_INTEROPSERVICES_ASSEMBLYREGISTRATIONFLAGS): BOOLEAN is
		external
			"IL deferred signature (System.Reflection.Assembly, System.Runtime.InteropServices.AssemblyRegistrationFlags): System.Boolean use System.Runtime.InteropServices.IRegistrationServices"
		alias
			"RegisterAssembly"
		end

	unregister_assembly (assembly: SYSTEM_REFLECTION_ASSEMBLY): BOOLEAN is
		external
			"IL deferred signature (System.Reflection.Assembly): System.Boolean use System.Runtime.InteropServices.IRegistrationServices"
		alias
			"UnregisterAssembly"
		end

end -- class SYSTEM_RUNTIME_INTEROPSERVICES_IREGISTRATIONSERVICES
