indexing
	Generator: "Eiffel Emitter 2.7b2"
	external_name: "System.Security.Cryptography.SymmetricAlgorithm"

deferred external class
	SYSTEM_SECURITY_CRYPTOGRAPHY_SYMMETRICALGORITHM

inherit
	ANY
		redefine
			finalize
		end

feature -- Access

	get_key: ARRAY [INTEGER_8] is
		external
			"IL signature (): System.Byte[] use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"get_Key"
		end

	get_key_size: INTEGER is
		external
			"IL signature (): System.Int32 use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"get_KeySize"
		end

	get_block_size: INTEGER is
		external
			"IL signature (): System.Int32 use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"get_BlockSize"
		end

	get_mode: SYSTEM_SECURITY_CRYPTOGRAPHY_CIPHERMODE is
		external
			"IL signature (): System.Security.Cryptography.CipherMode use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"get_Mode"
		end

	get_feedback_size: INTEGER is
		external
			"IL signature (): System.Int32 use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"get_FeedbackSize"
		end

	get_padding: SYSTEM_SECURITY_CRYPTOGRAPHY_PADDINGMODE is
		external
			"IL signature (): System.Security.Cryptography.PaddingMode use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"get_Padding"
		end

	get_legal_block_sizes: ARRAY [SYSTEM_SECURITY_CRYPTOGRAPHY_KEYSIZES] is
		external
			"IL signature (): System.Security.Cryptography.KeySizes[] use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"get_LegalBlockSizes"
		end

	get_iv: ARRAY [INTEGER_8] is
		external
			"IL signature (): System.Byte[] use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"get_IV"
		end

	get_legal_key_sizes: ARRAY [SYSTEM_SECURITY_CRYPTOGRAPHY_KEYSIZES] is
		external
			"IL signature (): System.Security.Cryptography.KeySizes[] use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"get_LegalKeySizes"
		end

feature -- Element Change

	set_mode (value: SYSTEM_SECURITY_CRYPTOGRAPHY_CIPHERMODE) is
		external
			"IL signature (System.Security.Cryptography.CipherMode): System.Void use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"set_Mode"
		end

	set_iv (value: ARRAY [INTEGER_8]) is
		external
			"IL signature (System.Byte[]): System.Void use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"set_IV"
		end

	set_feedback_size (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"set_FeedbackSize"
		end

	set_block_size (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"set_BlockSize"
		end

	set_key_size (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"set_KeySize"
		end

	set_padding (value: SYSTEM_SECURITY_CRYPTOGRAPHY_PADDINGMODE) is
		external
			"IL signature (System.Security.Cryptography.PaddingMode): System.Void use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"set_Padding"
		end

	set_key (value: ARRAY [INTEGER_8]) is
		external
			"IL signature (System.Byte[]): System.Void use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"set_Key"
		end

feature -- Basic Operations

	frozen Create_: SYSTEM_SECURITY_CRYPTOGRAPHY_SYMMETRICALGORITHM is
		external
			"IL static signature (): System.Security.Cryptography.SymmetricAlgorithm use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"Create"
		end

	create_decryptor_array_byte (rgb_key: ARRAY [INTEGER_8]; rgb_iv: ARRAY [INTEGER_8]): SYSTEM_SECURITY_CRYPTOGRAPHY_ICRYPTOTRANSFORM is
		external
			"IL deferred signature (System.Byte[], System.Byte[]): System.Security.Cryptography.ICryptoTransform use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"CreateDecryptor"
		end

	create_decryptor: SYSTEM_SECURITY_CRYPTOGRAPHY_ICRYPTOTRANSFORM is
		external
			"IL signature (): System.Security.Cryptography.ICryptoTransform use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"CreateDecryptor"
		end

	create_encryptor_array_byte (rgb_key: ARRAY [INTEGER_8]; rgb_iv: ARRAY [INTEGER_8]): SYSTEM_SECURITY_CRYPTOGRAPHY_ICRYPTOTRANSFORM is
		external
			"IL deferred signature (System.Byte[], System.Byte[]): System.Security.Cryptography.ICryptoTransform use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"CreateEncryptor"
		end

	frozen create__string (alg_name: STRING): SYSTEM_SECURITY_CRYPTOGRAPHY_SYMMETRICALGORITHM is
		external
			"IL static signature (System.String): System.Security.Cryptography.SymmetricAlgorithm use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"Create"
		end

	generate_key is
		external
			"IL deferred signature (): System.Void use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"GenerateKey"
		end

	create_encryptor: SYSTEM_SECURITY_CRYPTOGRAPHY_ICRYPTOTRANSFORM is
		external
			"IL signature (): System.Security.Cryptography.ICryptoTransform use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"CreateEncryptor"
		end

	frozen valid_key_size (bit_length: INTEGER): BOOLEAN is
		external
			"IL signature (System.Int32): System.Boolean use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"ValidKeySize"
		end

	generate_iv is
		external
			"IL deferred signature (): System.Void use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"GenerateIV"
		end

feature {NONE} -- Implementation

	finalize is
		external
			"IL signature (): System.Void use System.Security.Cryptography.SymmetricAlgorithm"
		alias
			"Finalize"
		end

end -- class SYSTEM_SECURITY_CRYPTOGRAPHY_SYMMETRICALGORITHM
