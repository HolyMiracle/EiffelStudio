
class EWB_F_COMPILE

inherit

	EWB_C_CODE
		rename
			name as f_compile_cmd_name,
			help_message as f_compile_help,
			abbreviation as f_compile_abb
		end;

feature

	c_code_directory: STRING is
		do
			Result := Final_generation_path
		end;

end
