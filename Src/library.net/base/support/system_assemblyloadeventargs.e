indexing
	Generator: "Eiffel Emitter 2.7b2"
	external_name: "System.AssemblyLoadEventArgs"

external class
	SYSTEM_ASSEMBLYLOADEVENTARGS

inherit
	SYSTEM_EVENTARGS

create
	make_assemblyloadeventargs

feature {NONE} -- Initialization

	frozen make_assemblyloadeventargs (loaded_assembly: SYSTEM_REFLECTION_ASSEMBLY) is
		external
			"IL creator signature (System.Reflection.Assembly) use System.AssemblyLoadEventArgs"
		end

feature -- Access

	frozen get_loaded_assembly: SYSTEM_REFLECTION_ASSEMBLY is
		external
			"IL signature (): System.Reflection.Assembly use System.AssemblyLoadEventArgs"
		alias
			"get_LoadedAssembly"
		end

end -- class SYSTEM_ASSEMBLYLOADEVENTARGS
