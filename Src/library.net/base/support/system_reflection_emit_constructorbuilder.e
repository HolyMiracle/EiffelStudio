indexing
	Generator: "Eiffel Emitter 2.7b2"
	external_name: "System.Reflection.Emit.ConstructorBuilder"

frozen external class
	SYSTEM_REFLECTION_EMIT_CONSTRUCTORBUILDER

inherit
	SYSTEM_REFLECTION_CONSTRUCTORINFO
		redefine
			to_string
		end
	SYSTEM_REFLECTION_ICUSTOMATTRIBUTEPROVIDER

create {NONE}

feature -- Access

	frozen get_signature: STRING is
		external
			"IL signature (): System.String use System.Reflection.Emit.ConstructorBuilder"
		alias
			"get_Signature"
		end

	get_name: STRING is
		external
			"IL signature (): System.String use System.Reflection.Emit.ConstructorBuilder"
		alias
			"get_Name"
		end

	frozen get_init_locals: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Reflection.Emit.ConstructorBuilder"
		alias
			"get_InitLocals"
		end

	get_reflected_type: SYSTEM_TYPE is
		external
			"IL signature (): System.Type use System.Reflection.Emit.ConstructorBuilder"
		alias
			"get_ReflectedType"
		end

	get_declaring_type: SYSTEM_TYPE is
		external
			"IL signature (): System.Type use System.Reflection.Emit.ConstructorBuilder"
		alias
			"get_DeclaringType"
		end

	get_method_handle: SYSTEM_RUNTIMEMETHODHANDLE is
		external
			"IL signature (): System.RuntimeMethodHandle use System.Reflection.Emit.ConstructorBuilder"
		alias
			"get_MethodHandle"
		end

	frozen get_return_type: SYSTEM_TYPE is
		external
			"IL signature (): System.Type use System.Reflection.Emit.ConstructorBuilder"
		alias
			"get_ReturnType"
		end

	get_attributes: SYSTEM_REFLECTION_METHODATTRIBUTES is
		external
			"IL signature (): System.Reflection.MethodAttributes use System.Reflection.Emit.ConstructorBuilder"
		alias
			"get_Attributes"
		end

feature -- Element Change

	frozen set_init_locals (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Reflection.Emit.ConstructorBuilder"
		alias
			"set_InitLocals"
		end

feature -- Basic Operations

	frozen add_declarative_security (action: SYSTEM_SECURITY_PERMISSIONS_SECURITYACTION; pset: SYSTEM_SECURITY_PERMISSIONSET) is
		external
			"IL signature (System.Security.Permissions.SecurityAction, System.Security.PermissionSet): System.Void use System.Reflection.Emit.ConstructorBuilder"
		alias
			"AddDeclarativeSecurity"
		end

	frozen set_sym_custom_attribute (name: STRING; data: ARRAY [INTEGER_8]) is
		external
			"IL signature (System.String, System.Byte[]): System.Void use System.Reflection.Emit.ConstructorBuilder"
		alias
			"SetSymCustomAttribute"
		end

	invoke_object_binding_flags (obj: ANY; invoke_attr: SYSTEM_REFLECTION_BINDINGFLAGS; binder: SYSTEM_REFLECTION_BINDER; parameters: ARRAY [ANY]; culture: SYSTEM_GLOBALIZATION_CULTUREINFO): ANY is
		external
			"IL signature (System.Object, System.Reflection.BindingFlags, System.Reflection.Binder, System.Object[], System.Globalization.CultureInfo): System.Object use System.Reflection.Emit.ConstructorBuilder"
		alias
			"Invoke"
		end

	frozen set_custom_attribute (custom_builder: SYSTEM_REFLECTION_EMIT_CUSTOMATTRIBUTEBUILDER) is
		external
			"IL signature (System.Reflection.Emit.CustomAttributeBuilder): System.Void use System.Reflection.Emit.ConstructorBuilder"
		alias
			"SetCustomAttribute"
		end

	invoke_binding_flags (invoke_attr: SYSTEM_REFLECTION_BINDINGFLAGS; binder: SYSTEM_REFLECTION_BINDER; parameters: ARRAY [ANY]; culture: SYSTEM_GLOBALIZATION_CULTUREINFO): ANY is
		external
			"IL signature (System.Reflection.BindingFlags, System.Reflection.Binder, System.Object[], System.Globalization.CultureInfo): System.Object use System.Reflection.Emit.ConstructorBuilder"
		alias
			"Invoke"
		end

	frozen define_parameter (i_sequence: INTEGER; attributes: SYSTEM_REFLECTION_PARAMETERATTRIBUTES; str_param_name: STRING): SYSTEM_REFLECTION_EMIT_PARAMETERBUILDER is
		external
			"IL signature (System.Int32, System.Reflection.ParameterAttributes, System.String): System.Reflection.Emit.ParameterBuilder use System.Reflection.Emit.ConstructorBuilder"
		alias
			"DefineParameter"
		end

	get_method_implementation_flags: SYSTEM_REFLECTION_METHODIMPLATTRIBUTES is
		external
			"IL signature (): System.Reflection.MethodImplAttributes use System.Reflection.Emit.ConstructorBuilder"
		alias
			"GetMethodImplementationFlags"
		end

	get_custom_attributes (inherit_: BOOLEAN): ARRAY [ANY] is
		external
			"IL signature (System.Boolean): System.Object[] use System.Reflection.Emit.ConstructorBuilder"
		alias
			"GetCustomAttributes"
		end

	get_custom_attributes_type (attribute_type: SYSTEM_TYPE; inherit_: BOOLEAN): ARRAY [ANY] is
		external
			"IL signature (System.Type, System.Boolean): System.Object[] use System.Reflection.Emit.ConstructorBuilder"
		alias
			"GetCustomAttributes"
		end

	get_parameters: ARRAY [SYSTEM_REFLECTION_PARAMETERINFO] is
		external
			"IL signature (): System.Reflection.ParameterInfo[] use System.Reflection.Emit.ConstructorBuilder"
		alias
			"GetParameters"
		end

	frozen get_module: SYSTEM_REFLECTION_MODULE is
		external
			"IL signature (): System.Reflection.Module use System.Reflection.Emit.ConstructorBuilder"
		alias
			"GetModule"
		end

	frozen get_token: SYSTEM_REFLECTION_EMIT_METHODTOKEN is
		external
			"IL signature (): System.Reflection.Emit.MethodToken use System.Reflection.Emit.ConstructorBuilder"
		alias
			"GetToken"
		end

	to_string: STRING is
		external
			"IL signature (): System.String use System.Reflection.Emit.ConstructorBuilder"
		alias
			"ToString"
		end

	frozen set_implementation_flags (attributes: SYSTEM_REFLECTION_METHODIMPLATTRIBUTES) is
		external
			"IL signature (System.Reflection.MethodImplAttributes): System.Void use System.Reflection.Emit.ConstructorBuilder"
		alias
			"SetImplementationFlags"
		end

	is_defined (attribute_type: SYSTEM_TYPE; inherit_: BOOLEAN): BOOLEAN is
		external
			"IL signature (System.Type, System.Boolean): System.Boolean use System.Reflection.Emit.ConstructorBuilder"
		alias
			"IsDefined"
		end

	frozen set_custom_attribute_constructor_info (con: SYSTEM_REFLECTION_CONSTRUCTORINFO; binary_attribute: ARRAY [INTEGER_8]) is
		external
			"IL signature (System.Reflection.ConstructorInfo, System.Byte[]): System.Void use System.Reflection.Emit.ConstructorBuilder"
		alias
			"SetCustomAttribute"
		end

	frozen get_ilgenerator: SYSTEM_REFLECTION_EMIT_ILGENERATOR is
		external
			"IL signature (): System.Reflection.Emit.ILGenerator use System.Reflection.Emit.ConstructorBuilder"
		alias
			"GetILGenerator"
		end

end -- class SYSTEM_REFLECTION_EMIT_CONSTRUCTORBUILDER
