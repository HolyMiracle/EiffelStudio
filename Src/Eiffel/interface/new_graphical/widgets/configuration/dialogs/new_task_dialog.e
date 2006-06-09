indexing
	description: "Dialog that allows to choose what kind of task to add."
	date: "$Date$"
	revision: "$Revision$"

class
	NEW_TASK_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize
		end

	PROPERTY_GRID_LAYOUT
		undefine
			default_create,
			copy
		end

	CONF_INTERFACE_NAMES
		undefine
			default_create,
			copy
		end

	EB_LAYOUT_CONSTANTS
		undefine
			default_create,
			copy
		end

create
	default_create,
	make_with_title

feature {NONE} -- Initialization

	initialize is
			-- Initialize.
		local
			vb: EV_VERTICAL_BOX
			hb1, hb: EV_HORIZONTAL_BOX
			cl: EV_CELL
			rb: EV_RADIO_BUTTON
		do
			Precursor {EV_DIALOG}

			set_title (dialog_task_add)

			create hb1
			extend (hb1)
			append_margin (hb1)
			create vb
			hb1.extend (vb)
			append_margin (vb)
			create element_container
			vb.extend (element_container)

			create rb.make_with_text_and_action (task_pre, agent on_pre)
			element_container.extend (rb)
			create rb.make_with_text_and_action (task_post, agent on_post)
			element_container.extend (rb)

			append_small_margin (vb)

			create hb
			vb.extend (hb)
			vb.disable_item_expand (hb)
			create cl
			hb.extend (cl)
			create ok_button.make_with_text_and_action ("Ok", agent on_ok)
			hb.extend (ok_button)
			hb.disable_item_expand (ok_button)
			ok_button.set_minimum_width (default_button_width)
			create cancel_button.make_with_text_and_action ("Cancel", agent on_cancel)
			hb.extend (cancel_button)
			hb.disable_item_expand (cancel_button)
			cancel_button.set_minimum_width (default_button_width)

			append_margin (vb)
			append_margin (hb1)

			set_default_push_button (ok_button)
			set_default_cancel_button (cancel_button)
		end

feature -- Access

	is_ok: BOOLEAN
			-- Did the dialog close with an ok?

	is_pre: BOOLEAN
			-- Was pre compilation as type of the new task choosen?
	is_post: BOOLEAN is
			-- Was post compilation as type of the new external choosen?
		do
			Result := not is_pre
		end

feature {NONE} -- GUI elements

	element_container: EV_VERTICAL_BOX
			-- Container to add new elements.

	cancel_button: EV_BUTTON
			-- Cancel button.

	ok_button: EV_BUTTON
			-- Ok Button.

feature {NONE} -- Agents

	on_pre is
			-- Pre compilation was choosen.
		do
			is_pre := True
		end

	on_post is
			-- Post compilation was choosen.
		do
			is_pre := False
		end

	on_ok is
			-- Ok was pressed.
		do
			is_ok := True
			destroy
		end

	on_cancel is
			-- Cancel was pressed.
		do
			is_ok := False
			destroy
		end

invariant
	elements: is_initialized implies ok_button /= Void and cancel_button /= Void

end
