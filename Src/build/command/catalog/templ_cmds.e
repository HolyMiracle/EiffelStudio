
class TEMPL_CMDS 

inherit

	COMMAND_PAGE
		rename 
			make as page_create, 
			make_visible as make_page_visible 
		redefine
			initial_cmd
		end;

	COMMAND_PAGE
		redefine
			make_visible, make, initial_cmd
		select
			make_visible, make
		end


creation

	make

	
feature {NONE}

	command_command: COMMAND_CMD;

	undoable_command: UNDOABLE_CMD;

	--exit_command: EXIT_CMD;

feature 

	make (page_n: STRING; a_symbol: PIXMAP; cat: CMD_CATALOG) is
		do
			page_create (page_n, a_symbol, cat);
		end;

	initial_cmd is
		do
			!!command_command.make;
			!!undoable_command.make;
			extend (command_command);
			extend (undoable_command);
		end;


	
feature {CATALOG}

	make_visible (a_name: STRING; a_parent: COMPOSITE) is
		do
			make_page_visible (a_name, a_parent);
		end;

end -- class TEMPL_CMDS
