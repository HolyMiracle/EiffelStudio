indexing
	description: "Represents the predefined command Build_close_cmd."
	date: "$Date$"
	id: "$Id$"
	revision: "$Revision$"

class
	CLOSE_WINDOW_CMD

inherit
	PREDEF_CMD

creation

	make

feature 

	eiffel_type: STRING is "BUILD_CLOSE_CMD";

	label: STRING is "Close window";

	identifier: INTEGER is
		do
			Result := - close_window_cmd_id
		end;

	arguments: EB_LINKED_LIST [ARG] is
		local
			arg: ARG
		once
			!! Result.make
			!! arg.session_init (context_catalog.container_page.perm_wind_type)
			Result.extend (arg)
		end

	labels: EB_LINKED_LIST [CMD_LABEL] is
		local
			lab: CMD_LABEL
		once
			!! Result.make;
			!! lab.make ("close window");
			Result.extend (lab);
		end

end -- class CLOSE_WINDOW_CMD
