indexing
	Generator: "Eiffel Emitter 2.7b2"
	external_name: "System.Security.Policy.Site"

frozen external class
	SYSTEM_SECURITY_POLICY_SITE

inherit
	ANY
		redefine
			finalize,
			get_hash_code,
			is_equal,
			to_string
		end
	SYSTEM_SECURITY_POLICY_IIDENTITYPERMISSIONFACTORY

create
	make

feature {NONE} -- Initialization

	frozen make (name: STRING) is
		external
			"IL creator signature (System.String) use System.Security.Policy.Site"
		end

feature -- Access

	frozen get_name: STRING is
		external
			"IL signature (): System.String use System.Security.Policy.Site"
		alias
			"get_Name"
		end

feature -- Basic Operations

	frozen create_from_url (url: STRING): SYSTEM_SECURITY_POLICY_SITE is
		external
			"IL static signature (System.String): System.Security.Policy.Site use System.Security.Policy.Site"
		alias
			"CreateFromUrl"
		end

	get_hash_code: INTEGER is
		external
			"IL signature (): System.Int32 use System.Security.Policy.Site"
		alias
			"GetHashCode"
		end

	is_equal (o: ANY): BOOLEAN is
		external
			"IL signature (System.Object): System.Boolean use System.Security.Policy.Site"
		alias
			"Equals"
		end

	to_string: STRING is
		external
			"IL signature (): System.String use System.Security.Policy.Site"
		alias
			"ToString"
		end

	frozen create_identity_permission (evidence: SYSTEM_SECURITY_POLICY_EVIDENCE): SYSTEM_SECURITY_IPERMISSION is
		external
			"IL signature (System.Security.Policy.Evidence): System.Security.IPermission use System.Security.Policy.Site"
		alias
			"CreateIdentityPermission"
		end

	frozen copy: ANY is
		external
			"IL signature (): System.Object use System.Security.Policy.Site"
		alias
			"Copy"
		end

feature {NONE} -- Implementation

	finalize is
		external
			"IL signature (): System.Void use System.Security.Policy.Site"
		alias
			"Finalize"
		end

end -- class SYSTEM_SECURITY_POLICY_SITE
