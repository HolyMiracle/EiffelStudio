indexing
	Generator: "Eiffel Emitter 2.7b2"
	external_name: "System.Reflection.Emit.SignatureToken"

frozen expanded external class
	SYSTEM_REFLECTION_EMIT_SIGNATURETOKEN

inherit
	VALUE_TYPE
		redefine
			get_hash_code,
			is_equal
		end

feature -- Access

	frozen empty: SYSTEM_REFLECTION_EMIT_SIGNATURETOKEN is
		external
			"IL static_field signature :System.Reflection.Emit.SignatureToken use System.Reflection.Emit.SignatureToken"
		alias
			"Empty"
		end

	frozen get_token: INTEGER is
		external
			"IL signature (): System.Int32 use System.Reflection.Emit.SignatureToken"
		alias
			"get_Token"
		end

feature -- Basic Operations

	get_hash_code: INTEGER is
		external
			"IL signature (): System.Int32 use System.Reflection.Emit.SignatureToken"
		alias
			"GetHashCode"
		end

	is_equal (obj: ANY): BOOLEAN is
		external
			"IL signature (System.Object): System.Boolean use System.Reflection.Emit.SignatureToken"
		alias
			"Equals"
		end

end -- class SYSTEM_REFLECTION_EMIT_SIGNATURETOKEN
