indexing
	Generator: "Eiffel Emitter 2.7b2"
	external_name: "System.Reflection.TypeFilter"

frozen external class
	SYSTEM_REFLECTION_TYPEFILTER

inherit
	SYSTEM_MULTICASTDELEGATE
	SYSTEM_ICLONEABLE
	SYSTEM_RUNTIME_SERIALIZATION_ISERIALIZABLE

create
	make_typefilter

feature {NONE} -- Initialization

	frozen make_typefilter (object: ANY; method: POINTER) is
		external
			"IL creator signature (System.Object, System.UIntPtr) use System.Reflection.TypeFilter"
		end

feature -- Basic Operations

	begin_invoke (m: SYSTEM_TYPE; filter_criteria: ANY; callback: SYSTEM_ASYNCCALLBACK; object: ANY): SYSTEM_IASYNCRESULT is
		external
			"IL signature (System.Type, System.Object, System.AsyncCallback, System.Object): System.IAsyncResult use System.Reflection.TypeFilter"
		alias
			"BeginInvoke"
		end

	end_invoke (result_: SYSTEM_IASYNCRESULT): BOOLEAN is
		external
			"IL signature (System.IAsyncResult): System.Boolean use System.Reflection.TypeFilter"
		alias
			"EndInvoke"
		end

	invoke (m: SYSTEM_TYPE; filter_criteria: ANY): BOOLEAN is
		external
			"IL signature (System.Type, System.Object): System.Boolean use System.Reflection.TypeFilter"
		alias
			"Invoke"
		end

end -- class SYSTEM_REFLECTION_TYPEFILTER
