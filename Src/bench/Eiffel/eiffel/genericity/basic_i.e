deferred class BASIC_I

inherit

	CL_TYPE_I
		rename
			is_void as cl_type_is_void,
			same_type as general_same_type
		undefine
			type_a
		redefine
			is_basic, is_reference, c_type, base_class, is_valid,
			cecil_value
		end;
	TYPE_C
		undefine
			is_bit
		end;
	SHARED_C_LEVEL
		rename
			same_type as general_same_type
		end

feature

	c_type: TYPE_C is
			-- C type
		do
			Result := Current;
		end;

	is_reference: BOOLEAN is false;
			-- Type is not a reference.

	is_basic: BOOLEAN is
			-- Type is a basic type.
		do
			Result := True;
		end;

	is_valid: BOOLEAN is
		do
			Result := True;
		end;

	byte_code_cast: CHARACTER is
			-- Code for the interpreter cast
		do	
		end;

	associated_reference: CLASS_TYPE is
			-- Reference class associated with simple type
		deferred
		end;

	associated_dtype: INTEGER is
			-- Dynamic type of associated reference class
		do
			Result := associated_reference.type_id - 1;
		end;

	base_class: CLASS_C is
			-- Associated class
		do
			Result := associated_reference.associated_class
		end;

	metamorphose
	(reg, value: REGISTRABLE; file: INDENT_FILE; workbench_mode: BOOLEAN) is
			-- Generate the metamorphism from simple type to reference and
			-- put result in register `reg'. The value of the basic type is
			-- held in `value'.
		require
			valid_reg: reg /= Void;
			valid_value: value /= Void;
			valid_file: file /= Void
		do
			reg.print_register;
			file.putstring (" = ");
			file.putstring("RTLN(");
			if workbench_mode then
				file.putstring ("RTUD(");
				file.putint (associated_reference.id.id - 1);
				file.putchar (')');
			else
				file.putint (associated_dtype);
			end;
			file.putchar (')');
			file.putchar (',');
			file.putchar (' ');
			file.putchar ('*');
			generate_access_cast (file);
			reg.print_register;
			file.putstring (" = ");
			value.print_register;
		end;

	cecil_value: INTEGER is
		do
			Result := sk_value
		end;

end
