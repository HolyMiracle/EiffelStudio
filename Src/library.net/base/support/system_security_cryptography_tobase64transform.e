indexing
	Generator: "Eiffel Emitter 2.7b2"
	external_name: "System.Security.Cryptography.ToBase64Transform"

external class
	SYSTEM_SECURITY_CRYPTOGRAPHY_TOBASE64TRANSFORM

inherit
	ANY
		redefine
			finalize,
			get_hash_code,
			is_equal,
			to_string
		end
	SYSTEM_SECURITY_CRYPTOGRAPHY_ICRYPTOTRANSFORM

create
	make

feature {NONE} -- Initialization

	frozen make is
		external
			"IL creator use System.Security.Cryptography.ToBase64Transform"
		end

feature -- Access

	frozen get_input_block_size: INTEGER is
		external
			"IL signature (): System.Int32 use System.Security.Cryptography.ToBase64Transform"
		alias
			"get_InputBlockSize"
		end

	frozen get_output_block_size: INTEGER is
		external
			"IL signature (): System.Int32 use System.Security.Cryptography.ToBase64Transform"
		alias
			"get_OutputBlockSize"
		end

	frozen get_can_transform_multiple_blocks: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Security.Cryptography.ToBase64Transform"
		alias
			"get_CanTransformMultipleBlocks"
		end

feature -- Basic Operations

	get_hash_code: INTEGER is
		external
			"IL signature (): System.Int32 use System.Security.Cryptography.ToBase64Transform"
		alias
			"GetHashCode"
		end

	frozen transform_block (input_buffer: ARRAY [INTEGER_8]; input_offset: INTEGER; input_count: INTEGER; output_buffer: ARRAY [INTEGER_8]; output_offset: INTEGER): INTEGER is
		external
			"IL signature (System.Byte[], System.Int32, System.Int32, System.Byte[], System.Int32): System.Int32 use System.Security.Cryptography.ToBase64Transform"
		alias
			"TransformBlock"
		end

	frozen transform_final_block (input_buffer: ARRAY [INTEGER_8]; input_offset: INTEGER; input_count: INTEGER): ARRAY [INTEGER_8] is
		external
			"IL signature (System.Byte[], System.Int32, System.Int32): System.Byte[] use System.Security.Cryptography.ToBase64Transform"
		alias
			"TransformFinalBlock"
		end

	to_string: STRING is
		external
			"IL signature (): System.String use System.Security.Cryptography.ToBase64Transform"
		alias
			"ToString"
		end

	is_equal (obj: ANY): BOOLEAN is
		external
			"IL signature (System.Object): System.Boolean use System.Security.Cryptography.ToBase64Transform"
		alias
			"Equals"
		end

feature {NONE} -- Implementation

	finalize is
		external
			"IL signature (): System.Void use System.Security.Cryptography.ToBase64Transform"
		alias
			"Finalize"
		end

end -- class SYSTEM_SECURITY_CRYPTOGRAPHY_TOBASE64TRANSFORM
