class IMPORT_WINDOW 

inherit

	FORM_D
		rename
			make as form_d_create,
			popup as form_d_popup,
			init_toolkit as form_d_init_toolkit
		end;
	SHARED_STORAGE_INFO;
	COMMAND;
	COMMAND_ARGS;
	WINDOWS
		select
			init_toolkit
		end
	CLOSEABLE;
	CONSTANTS

creation

	make

	
feature 

	file_selec: FILE_SELEC;

	entire_application: TOGGLE_B;
	interface, groups, commands, translations: TOGGLE_B;

	make (a_parent: COMPOSITE) is
		local
			separator: SEPARATOR;
			import_cmd: IMPORT_CMD;
			set_win_att: SET_WINDOW_ATTRIBUTES_COM;
			del_window: DELETE_WINDOW;
			mp: MOUSE_PTR
		do
			!! mp;
			mp.set_watch_shape;
			form_d_create (Widget_names.import_window, a_parent);
			set_title (Widget_names.import_window);
			!!file_selec.make ("box", Current);

			!!entire_application.make (Widget_names.entire_application_label, Current);
			!!interface.make (Widget_names.interface_label, Current);
			!!groups.make (Widget_names.groups_label, Current);
			!!commands.make (Widget_names.commands_label, Current);
			!!translations.make (Widget_names.translations_label, Current);

			!!import_cmd;

			file_selec.hide_help_button;
			file_selec.add_ok_action (import_cmd, Current);
			file_selec.add_cancel_action (Current, Second);
			set_exclusive_grab;
			file_selec.set_directory_selection;
			file_selec.hide_file_selection_list;
			file_selec.hide_file_selection_label;

			!!separator.make (Widget_names.separator, Current);
			separator.set_single_line;
			separator.set_horizontal (False);

			entire_application.add_release_action (Current, entire_application);
			interface.add_release_action (Current, interface);
			groups.add_release_action (Current, groups);
			commands.add_release_action (Current, commands);
			translations.add_release_action (Current, translations);

			attach_top (file_selec, 0);
			attach_top (entire_application, 30);
			attach_top_widget (entire_application, interface, 20);
			attach_top_widget (interface, groups, 10);
			attach_top_widget (groups, commands, 10);
			attach_top_widget (commands, translations, 10);

			attach_top (separator, 3);
			attach_bottom (separator, 3);

			attach_bottom (file_selec, 0);

			attach_left (file_selec, 0);
			attach_left_widget (file_selec, separator, 5);
			attach_left_widget (separator, entire_application, 5);
			attach_left_widget (separator, interface, 5);
			attach_left_widget (separator, groups, 5);
			attach_left_widget (separator, commands, 5);
			attach_left_widget (separator, translations, 5);
			!! set_win_att;
			set_win_att.execute (Current);
			!! del_window.make (Current);
			set_action ("<Unmap>", del_window, Void);
			mp.restore
		end;

	close is
		do
			popdown;
			last_cwd.wipe_out;
			last_cwd.append (clone (file_selec.directory));		
			destroy;	
		end;
	
	last_cwd: STRING is
		once
			!! Result.make (0);
		end;

	popup is
		do
			if not last_cwd.empty then
				file_selec.set_directory (last_cwd);
			end;
			form_d_popup
		end;

feature {NONE}

	execute (argument: ANY) is
		do
			if argument = second then
				close;
			elseif entire_application.state then
				interface.arm;
				groups.arm;
				commands.arm;
				translations.arm;
			elseif argument = interface then
				if interface.state then
					groups.arm;
				end;
			elseif argument = groups then
				if not groups.state and then interface.state then
					groups.arm
				end;
			end;
		end;

end
