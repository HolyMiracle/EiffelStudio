note

	status: "See notice at end of class.";
	date: "$Date$";
	revision: "$Revision$"

deferred class

	WM_SHELL_I 

feature -- Access

 	base_height: INTEGER
			-- Base for a progression of preferred heights
			-- for current window manager to use in sizing
			-- widgets.
			-- The preferred heights are `base_heights' plus
			-- integral multiples of `height_inc'
		deferred
		ensure
			positive_result: Result >= 0
		end;

	base_width: INTEGER
			-- Base for a progression of preferred widths
			-- for current window manager to use in sizing
			-- widgets.
			-- The preferred widths are `base_heights' plus
			-- integral multiples of `width_inc'
		deferred
		ensure
			positive_result: Result >= 0
		end;

	height_inc: INTEGER
			-- Increment for a progression of preferred
			-- heights for the window manager tu use in sizing 
			-- widgets.
		deferred
		ensure
			positive_resuult: Result >= 0
		end;

	width_inc: INTEGER
			-- Increment for a progression of preferred
			-- widths for the window manager tu use in sizing
			-- widgets.
		deferred
		ensure
			positive_result: Result >= 0
		end;

	icon_mask: PIXMAP
			-- Bitmap that could be used by window manager
			-- to clip `icon_pixmap' bitmap to make the
			-- icon nonrectangular 
		deferred
		end;

	max_height: INTEGER
			-- Maximum height that application wishes widget
			-- instance to have
		deferred
		ensure
			positive_result: Result >= 1
		end;

	icon_pixmap: PIXMAP
			-- Bitmap that could be used by the window manager
			-- as the application's icon
		deferred
		end;

	max_aspect_x: INTEGER
			-- Numerator of maximum aspect ratio (X/Y) that
			-- application wishes widget instance to have
		deferred
		end;

	icon_x: INTEGER
			-- Place to put application's icon
			-- Since the window manager controls icon placement
			-- policy, this may be ignored.
		deferred
		end;

	icon_y: INTEGER
			-- Place to put application's icon
			-- Since the window manager controls icon placement
			-- policy, this may be ignored.
		deferred
		end;

	max_aspect_y: INTEGER
			-- Denominator of maximum ration (X/Y) that
			-- application wishes widget instance to have
		deferred
		end;

	max_width: INTEGER
			-- Maximum width that application wishes widget
			-- instance to have
		deferred
		ensure
			positive_result: Result >= 1
		end;

	min_height: INTEGER
			-- minimum height that application wishes widget
			-- instance to have
		deferred
		ensure
			positive_result: Result >= 1
		end;

	min_width: INTEGER
			-- minimum width that application wishes widget
			-- instance to have
		deferred
		ensure
			positive_result: Result >= 1
		end;

	min_aspect_x: INTEGER
			-- Numerator of minimum aspect ratio (X/Y) that
			-- application wishes widget instance to have
		deferred
		end;

	min_aspect_y: INTEGER
			-- Denominator of minimum ration (X/Y) that
			-- application wishes widget instance to have
		deferred
		end;

	title: STRING
			-- Application name to be displayed by
			-- the window manager
		deferred
		end;

	widget_group: WIDGET
			-- Widget with wich current widget is associated.
			-- By convention this widget is the "leader" of a group
			-- widgets. Window manager will treat all widgets in
			-- a group in some way; for example, it may move or
			-- iconify them together
		deferred
		end

feature -- Element change

	set_base_height (a_height: INTEGER)
			-- Set `base_height' to `a_height'. 
		require
			height_large_enough: a_height >= 0
		deferred
		ensure
			set: base_height = a_height
		end;

	set_base_width (a_width: INTEGER)
			-- Set `base_width' to `a_width'.
		require
			width_large_enough: a_width >= 0
		deferred
		ensure
			set: base_width = a_width
		end;

	set_height_inc (an_increment: INTEGER)
			-- Set `height_inc' to `an_increment'.
		require
			an_increment_large_enought: an_increment >= 0
		deferred
		ensure
			set: height_inc = an_increment
		end;

	set_width_inc (an_increment: INTEGER)
			-- Set `width_inc' to `an_increment'.
		require
			an_increment_large_enough: an_increment >= 0
		deferred
		ensure
			set: width_inc = an_increment
		end;

	set_icon_mask (a_mask: PIXMAP)
			-- Set `icon_mask' to `a_mask'.
		require
			not_a_mask_void: a_mask /= Void
		deferred
		end;

	set_icon_pixmap (a_pixmap: PIXMAP)
			-- Set `icon_pixmap' to `a_pixmap'.
		require
			not_a_pixmap_void: a_pixmap /= Void
		deferred
		end;

	set_icon_x (x_value: INTEGER)
			-- Set `icon_x' to `x_value'.
		deferred
		end;

	set_icon_y (y_value: INTEGER)
			-- Set `icon_y' to `y_value'.
		deferred
		end;

	set_max_aspect_x (a_max: INTEGER)
			-- Set `max_aspect_x' to `a_max'.
		deferred
		ensure
			set: max_aspect_x = a_max
		end;

	set_max_aspect_y (a_max: INTEGER)
			-- Set `max_aspect_y' to `a_max'.
		deferred
		ensure
			set: max_aspect_y = a_max
		end;

	set_max_height (a_height: INTEGER)
			-- Set `max_height' to `a_height'.
		require
			a_height_large_enough: a_height >= 1
		deferred
		ensure
			set: max_height = a_height
		end;

	set_max_width (a_max: INTEGER)
			-- Set `max_width' to `a_max'.
		require
			a_max_large_enough: a_max >= 1
		deferred
		ensure
			set: max_width = a_max
		end;

	set_min_aspect_x (a_min: INTEGER)
			-- Set `min_aspect_x' to `a_min'.
		deferred
		ensure
			set: min_aspect_x = a_min
		end;

	set_min_aspect_y (a_min: INTEGER)
			-- Set `min_aspect_y' to `a_min'.
		deferred
		ensure
			set: min_aspect_y = a_min
		end;

	set_min_height (a_height: INTEGER)
			-- Set `min_height' to `a_height'.
		require
			a_height_large_enough: a_height >= 1
		deferred
		ensure
			set: min_height = a_height
		end;

	set_min_width (a_min: INTEGER)
			-- Set `min_width' to `a_min'.
		require
			a_min_large_enough: a_min >= 1
		deferred
		ensure
			set: min_width = a_min
		end;

	set_title (a_title: STRING)
			-- Set `title' to `a_title'.
		require
			not_a_title_void: a_title /= Void
		deferred
		end;

	set_widget_group (a_widget: WIDGET)
			-- Set `widget_group' to `a_widget'.
		deferred
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




end -- class WM_SHELL_I

