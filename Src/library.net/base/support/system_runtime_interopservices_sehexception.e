indexing
	Generator: "Eiffel Emitter 2.7b2"
	external_name: "System.Runtime.InteropServices.SEHException"

external class
	SYSTEM_RUNTIME_INTEROPSERVICES_SEHEXCEPTION

inherit
	SYSTEM_RUNTIME_INTEROPSERVICES_EXTERNALEXCEPTION
	SYSTEM_RUNTIME_SERIALIZATION_ISERIALIZABLE

create
	make_sehexception_1,
	make_sehexception,
	make_sehexception_2

feature {NONE} -- Initialization

	frozen make_sehexception_1 (message: STRING) is
		external
			"IL creator signature (System.String) use System.Runtime.InteropServices.SEHException"
		end

	frozen make_sehexception is
		external
			"IL creator use System.Runtime.InteropServices.SEHException"
		end

	frozen make_sehexception_2 (message: STRING; inner: SYSTEM_EXCEPTION) is
		external
			"IL creator signature (System.String, System.Exception) use System.Runtime.InteropServices.SEHException"
		end

feature -- Basic Operations

	can_resume: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Runtime.InteropServices.SEHException"
		alias
			"CanResume"
		end

end -- class SYSTEM_RUNTIME_INTEROPSERVICES_SEHEXCEPTION
