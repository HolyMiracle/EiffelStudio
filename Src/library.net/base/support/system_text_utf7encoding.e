indexing
	Generator: "Eiffel Emitter 2.7b2"
	external_name: "System.Text.UTF7Encoding"

external class
	SYSTEM_TEXT_UTF7ENCODING

inherit
	SYSTEM_TEXT_ENCODING
		redefine
			get_encoder,
			get_decoder
		end

create
	make_utf7encoding,
	make_utf7encoding_1

feature {NONE} -- Initialization

	frozen make_utf7encoding is
		external
			"IL creator use System.Text.UTF7Encoding"
		end

	frozen make_utf7encoding_1 (allow_optionals: BOOLEAN) is
		external
			"IL creator signature (System.Boolean) use System.Text.UTF7Encoding"
		end

feature -- Basic Operations

	get_max_char_count (byte_count: INTEGER): INTEGER is
		external
			"IL signature (System.Int32): System.Int32 use System.Text.UTF7Encoding"
		alias
			"GetMaxCharCount"
		end

	get_char_count_array_byte_int32 (bytes: ARRAY [INTEGER_8]; index: INTEGER; count: INTEGER): INTEGER is
		external
			"IL signature (System.Byte[], System.Int32, System.Int32): System.Int32 use System.Text.UTF7Encoding"
		alias
			"GetCharCount"
		end

	get_decoder: SYSTEM_TEXT_DECODER is
		external
			"IL signature (): System.Text.Decoder use System.Text.UTF7Encoding"
		alias
			"GetDecoder"
		end

	get_encoder: SYSTEM_TEXT_ENCODER is
		external
			"IL signature (): System.Text.Encoder use System.Text.UTF7Encoding"
		alias
			"GetEncoder"
		end

	get_chars_array_byte_int32_int32_array_char (bytes: ARRAY [INTEGER_8]; byte_index: INTEGER; byte_count: INTEGER; chars: ARRAY [CHARACTER]; char_index: INTEGER): INTEGER is
		external
			"IL signature (System.Byte[], System.Int32, System.Int32, System.Char[], System.Int32): System.Int32 use System.Text.UTF7Encoding"
		alias
			"GetChars"
		end

	get_max_byte_count (char_count: INTEGER): INTEGER is
		external
			"IL signature (System.Int32): System.Int32 use System.Text.UTF7Encoding"
		alias
			"GetMaxByteCount"
		end

	get_bytes_array_char_int32_int32_array_byte_int32 (chars: ARRAY [CHARACTER]; char_index: INTEGER; char_count: INTEGER; bytes: ARRAY [INTEGER_8]; byte_index: INTEGER): INTEGER is
		external
			"IL signature (System.Char[], System.Int32, System.Int32, System.Byte[], System.Int32): System.Int32 use System.Text.UTF7Encoding"
		alias
			"GetBytes"
		end

	get_byte_count_array_char_int32 (chars: ARRAY [CHARACTER]; index: INTEGER; count: INTEGER): INTEGER is
		external
			"IL signature (System.Char[], System.Int32, System.Int32): System.Int32 use System.Text.UTF7Encoding"
		alias
			"GetByteCount"
		end

end -- class SYSTEM_TEXT_UTF7ENCODING
