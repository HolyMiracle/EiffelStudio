note

	description: 
		"EiffelVision Implementation of a Motif message box."
	legal: "See notice at end of class.";
	status: "See notice at end of class.";
	date: "$Date$";
	revision: "$Revision$"

class 
	MESSAGE_BOX_M

inherit

	MEL_MESSAGE_BOX
		rename
			make as message_make,
			make_no_auto_unmanage as message_make_no_auto_unmanage,
			foreground_color as mel_foreground_color,
			set_foreground_color as mel_set_foreground_color,
			background_color as mel_background_color,
			background_pixmap as mel_background_pixmap,
			set_background_color as mel_set_background_color,
			set_background_pixmap as mel_set_background_pixmap,
			destroy as mel_destroy,
			set_insensitive as mel_set_insensitive,
			screen as mel_screen,
			is_shown as shown
		select
			message_make, message_make_no_auto_unmanage
		end;

	TERMINAL_IMP
		undefine
			cancel_button, create_widget
		redefine
			make
		end;

create

	make

feature {NONE} -- Initialization

	make (a_message: BULLETIN; man: BOOLEAN; oui_parent: COMPOSITE)
			-- Create a motif message box.
		local
			mc: MEL_COMPOSITE
		do
			mc ?= oui_parent.implementation;
			widget_index := widget_manager.last_inserted_position;
			message_make (a_message.identifier, mc, man)
		end

feature -- Status setting

	set_left_alignment
			-- Set message alignment to beginning.
		do
			set_alignment_beginning
		end;

	set_center_alignment
			-- Set message alignment to center.
		do
			set_alignment_center
		end;

	set_right_alignment
			-- Set message alignment to right.
		do
			set_alignment_end
		end;

	set_message (a_message: STRING)
			-- Set `a_message' as message.
		local
			ms: MEL_STRING
		do
			create ms.make_default_l_to_r (a_message);
			set_message_string (ms);
			ms.destroy
		end;

	set_cancel_label (a_label: STRING)
			-- Set `a_label' as label for cancel button,
			-- by default this label is `cancel'.
		local
			ms: MEL_STRING
		do
			create ms.make_default_l_to_r (a_label);
			set_cancel_label_string (ms);
			ms.destroy
		end;

	set_help_label (a_label: STRING)
			-- Set `a_label' as label for help button,
			-- by default this label is `help'.
		local
			ms: MEL_STRING
		do
			create ms.make_default_l_to_r (a_label);
			set_help_label_string (ms);
			ms.destroy
		end;

	set_ok_label (a_label: STRING)
			-- Set `a_label' as label for ok button,
			-- by default this label is `ok'.
		local
			ms: MEL_STRING
		do
			create ms.make_default_l_to_r (a_label);
			set_ok_label_string (ms);
			ms.destroy
		end;

feature -- Display

	hide_help_button
			-- Make help button invisible.
		do
			help_button.unmanage
		end;

	hide_cancel_button
			-- Make cancel button invisible.
		do
			cancel_button.unmanage
		end;

	hide_ok_button
			-- Make ok button invisible.
		do
			ok_button.unmanage
		end;

	show_help_button
			-- Make help button visible.
		do
			help_button.manage
		end;

	show_cancel_button
			-- Make cancel button visible.
		do
			cancel_button.manage
		end;

	show_ok_button
			-- Make ok button visible.
		do
			ok_button.manage
		end

feature -- Element change

	add_cancel_action (a_command: COMMAND; argument: ANY)
			-- Add `a_command' to the list of action to execute when
			-- cancel button is activated.
		local
			a_list: VISION_COMMAND_LIST
		do
			a_list := vision_command_list (cancel_command);
			if a_list = Void then
				create a_list.make;
				set_cancel_callback (a_list, Void)
			end;
			a_list.add_command (a_command, argument)
		end;

	add_help_action (a_command: COMMAND; argument: ANY)
			-- Add `a_command' to the list of action to execute when
			-- help button is activated.
		local
			a_list: VISION_COMMAND_LIST
		do
			a_list := vision_command_list (help_command);
			if a_list = Void then
				create a_list.make;
				set_help_callback (a_list, Void)
			end;
			a_list.add_command (a_command, argument)
		end;

	add_ok_action (a_command: COMMAND; argument: ANY)
			-- Add `a_command' to the list of action to execute when
			-- ok button is activated.
		local
			a_list: VISION_COMMAND_LIST
		do
			a_list := vision_command_list (ok_command);
			if a_list = Void then
				create a_list.make;
				set_ok_callback (a_list, Void)
			end;
			a_list.add_command (a_command, argument)
		end;

feature -- Removal

	remove_cancel_action (a_command: COMMAND; argument: ANY)
			-- Remove `a_command' from the list of action to execute when
			-- cancel button is activated.
		do
			remove_command (cancel_command, a_command, argument)
		end;

	remove_help_action (a_command: COMMAND; argument: ANY)
			-- Remove `a_command' from the list of action to execute when
			-- help button is activated.
		do
			remove_command (help_command, a_command, argument)
		end;

	remove_ok_action (a_command: COMMAND; argument: ANY)
			-- Remove `a_command' from the list of action to execute when
			-- ok button is activated.
		do
			remove_command (ok_command, a_command, argument)
		end;

note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"




end -- class MESSAGE_BOX_M

