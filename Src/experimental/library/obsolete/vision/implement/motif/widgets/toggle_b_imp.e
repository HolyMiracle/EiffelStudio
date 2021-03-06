note

	description:
		"EiffelVision implementation of a Motif toggle button."
	legal: "See notice at end of class.";
	status: "See notice at end of class.";
	date: "$Date$";
	revision: "$Revision$"

class 
	TOGGLE_B_IMP

inherit

	TOGGLE_B_I
		rename
			set_accelerator_action as set_accelerator
		end;

	BUTTON_IMP
		undefine
			create_callback_struct
		end;

	FONTABLE_IMP;

	MEL_TOGGLE_BUTTON
		rename
			make as mel_toggle_make,
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
			mel_toggle_make
		end

create

	make

feature {NONE} -- Creation

	make (a_toggle_b: TOGGLE_B; man: BOOLEAN; oui_parent: COMPOSITE)
			-- Create a motif toggle button.
		local
			mc: MEL_COMPOSITE
		do
			mc ?= oui_parent.implementation;
			widget_index := widget_manager.last_inserted_position;
			mel_toggle_make (a_toggle_b.identifier, mc, man);
			a_toggle_b.set_font_imp (Current);	
			set_mnemonic_from_text (a_toggle_b.identifier, False)
		end;

feature -- Element change

	add_arm_action (a_command: COMMAND; argument: ANY)
			-- Add `a_command' to the list of action to execute when current
			-- toggle button is armed.
		local
			list: VISION_COMMAND_LIST
		do
			list := vision_command_list (arm_command);
			if list = Void then
				create list.make;
				set_arm_callback (list, Void)
			end;
			list.add_command (a_command, argument)
		end;

	add_release_action (a_command: COMMAND; argument: ANY)
			-- Add `a_command' to the list of action to execute when current
			-- toggle button is released.
		local
			list: VISION_COMMAND_LIST
		do
			list := vision_command_list (disarm_command);
			if list = Void then
				create list.make;
				set_disarm_callback (list, Void)
			end;
			list.add_command (a_command, argument)
		end;

	add_activate_action, add_value_changed_action (a_command: COMMAND; argument: ANY)
			-- Add `a_command' to the list of action to execute when value
			-- is changed.
		local
			list: VISION_COMMAND_LIST
		do
			list := vision_command_list (value_changed_command);
			if list = Void then
				create list.make;
				set_value_changed_callback (list, Void)
			end;
			list.add_command (a_command, argument)
		end;

feature -- Removal

	remove_arm_action (a_command: COMMAND; argument: ANY)
			-- Remove `a_command' from the list of action to execute when
			-- current toggle button is armed.
		do
			remove_command (arm_command, a_command, argument)
		end;

	remove_release_action (a_command: COMMAND; argument: ANY)
			-- Remove `a_command' from the list of action to execute when
			-- current toggle button is released.
		do
			remove_command (disarm_command, a_command, argument)
		end;

	remove_activate_action, remove_value_changed_action (a_command: COMMAND; argument: ANY)
			-- Remove `a_command' from the list of action to execute when
			-- value is changed.
		do
			remove_command (value_changed_command, a_command, argument)
		end;

	remove_accelerator_action
			-- Remove the accelerator action.
		do
			set_accelerator (Void)
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




end -- class TOGGLE_B_IMP

