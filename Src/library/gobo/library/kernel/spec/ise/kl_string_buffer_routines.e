indexing

	description:

		"Routines that ought to be in class STRING_BUFFER. %
		%A string buffer is a sequence of characters equipped %
		%with features `put', `item' and `count'."

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_STRING_BUFFER_ROUTINES

inherit

	KL_IMPORTED_STRING_BUFFER_ROUTINES
	KL_IMPORTED_INPUT_STREAM_ROUTINES

feature -- Initialization

	make (n: INTEGER): like STRING_BUFFER_TYPE is
			-- Create a new string buffer being able
			-- to contain `n' characters.
		require
			non_negative_n: n >= 0
		local
			to_special: TO_SPECIAL [CHARACTER]
		do
			!! to_special.make_area (n)
			Result := to_special.area
		ensure
			string_buffer_not_void: Result /= Void
			count_set: Result.count = n
		end

	make_from_string (a_string: STRING): like STRING_BUFFER_TYPE is
			-- Create a new string buffer with characters from `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			Result := make (a_string.count)
			copy_from_string (Result, lower, a_string)
		ensure
			string_buffer_not_void: Result /= Void
			count_set: Result.count = a_string.count
			charaters_set: equal (substring (Result, lower, a_string.count + lower - 1), a_string)
		end

feature -- Conversion

	to_string_buffer (a_string: STRING): like STRING_BUFFER_TYPE is
			-- String buffer filled with characters from `a_string'.
			-- The string buffer and `a_string' may share internal
			-- data. Use `make_from_string' if this is a concern.
		require
			a_string_not_void: a_string /= Void
		do
			Result := a_string.area
		ensure
			string_buffer_not_void: Result /= Void
			count_set: Result.count >= a_string.count
			charaters_set: equal (substring (Result, lower, a_string.count + lower - 1), a_string)
		end

feature -- Access

	substring (a_buffer: like STRING_BUFFER_TYPE; s, e: INTEGER): STRING is
			-- New string made up of characters held in
			-- `a_buffer' between indexes `s' and `e'
		require
			a_buffer_not_void: a_buffer /= Void
			s_large_enough: s >= lower
			e_small_enough: e <= upper (a_buffer)
			valid_interval: s <= e + 1
		local
			a: ANY
			nb: INTEGER
		do
			if e < s then
					-- Empty string
				!! Result.make (0)
			else
				nb := e - s + 1
				!! Result.make (nb)
				a := Result.area
				c_memcpy ($a, c_offset_pointer ($a_buffer, s), nb)
				c_str_set_count ($Result, nb)
			end
		ensure
			substring_not_void: Result /= Void
			count_set: Result.count = e - s + 1
		end

feature -- Measurement

	lower: INTEGER is 0
			-- Lower index

	upper (a_buffer: like STRING_BUFFER_TYPE): INTEGER is
			-- Upper index
		require
			a_buffer_not_void: a_buffer /= Void
		do
			Result := a_buffer.count + lower - 1
		ensure
			definition: a_buffer.count = (Result - lower + 1)
		end

feature -- Element change

	append_substring_to_string (a_buffer: like STRING_BUFFER_TYPE;
		s, e: INTEGER; a_string: STRING) is
			-- Append string made up of characters held in `a_buffer'
			-- between indexes `s' and `e' to `a_string'.
		require
			a_buffer_not_void: a_buffer /= Void
			a_string_not_void: a_string /= Void
			not_same: to_string_buffer (a_string) /= a_buffer
			s_large_enough: s >= lower
			e_small_enough: e <= upper (a_buffer)
			valid_interval: s <= e + 1
		local
			nb, old_count, new_count: INTEGER
			a: ANY
		do
			if s <= e then
				nb := e - s + 1
				old_count := a_string.count
				new_count := old_count + nb
				if new_count > a_string.capacity then
					a_string.resize (new_count + a_string.additional_space)
				end
				a := a_string.area
				c_memmove (c_offset_pointer ($a, old_count), c_offset_pointer ($a_buffer, s), nb)
				c_str_set_count ($a_string, new_count)
			end
		ensure
			count_set: a_string.count = old (a_string.count) + (e - s + 1)
			characters_set: s <= e implies equal (a_string.substring (old (a_string.count) + 1, a_string.count), substring (a_buffer, s, e))
		end

	copy_from_string (a_buffer: like STRING_BUFFER_TYPE; pos: INTEGER; a_string: STRING) is
			-- Copy characters of `a_string' to `a_buffer'
			-- starting at position `pos'.
		require
			a_buffer_not_void: a_buffer /= Void
			a_string_not_void: a_string /= Void
			not_same: to_string_buffer (a_string) /= a_buffer
			pos_large_enough: pos >= lower
			enough_space: (pos + a_string.count - 1) <= upper (a_buffer)
		local
			nb: INTEGER
			a: ANY
		do
			nb := a_string.count
			if nb > 0 then
				a := a_string.area
				c_memcpy (c_offset_pointer ($a_buffer, pos), $a, nb)
			end
		ensure
			charaters_set: equal (substring (a_buffer, pos, a_string.count + pos - 1), a_string)
		end

	copy_from_stream (a_buffer: like STRING_BUFFER_TYPE; pos: INTEGER;
		a_stream: like INPUT_STREAM_TYPE; nb_char: INTEGER): INTEGER is
			-- Fill `a_buffer', starting at position `pos' with
			-- at most `nb_char' characters read from `a_stream'.
			-- Return the number of characters actually read.
		require
			a_buffer_not_void: a_buffer /= Void
			pos_large_enough: pos >= lower
			a_stream_not_void: a_stream /= Void
			a_stream_open_read: INPUT_STREAM_.is_open_read (a_stream)
			nb_char_large_enough: nb_char >= 0
			enough_space: (pos + nb_char - 1) <= upper (a_buffer)
		local
			a_file: FILE
			a_string: STRING
			a_console: CONSOLE
		do
			a_file ?= a_stream
			if a_file /= Void then
				a_console ?= a_file
				if a_console /= Void then
					Result := c_console_readstream (a_console.file_pointer, c_offset_pointer ($a_buffer, pos), nb_char)
				else
					Result := c_file_gss (a_file.file_pointer, c_offset_pointer ($a_buffer, pos), nb_char)
				end
			else
				a_stream.read_stream (nb_char)
				a_string := a_stream.last_string
				Result := a_string.count
				copy_from_string (a_buffer, pos, a_string)
			end
		ensure
			nb_char_read_large_enough: Result >= 0
			nb_char_read_small_enough: Result <= nb_char
		end

	move_left (a_buffer: like STRING_BUFFER_TYPE; old_pos, new_pos: INTEGER; nb: INTEGER) is
			-- Copy `nb' characters from `old_pos' to
			-- `new_pos' in `a_buffer'.
		require
			a_buffer_not_void: a_buffer /= Void
			nb_positive: nb >= 0
			old_pos_large_enough: old_pos >= lower
			enough_characters: (old_pos + nb - 1) <= upper (a_buffer)
			new_pos_large_enough: new_pos >= lower
			enough_space: (new_pos + nb - 1) <= upper (a_buffer)
			move_left: old_pos > new_pos
		do
			if nb > 0 then
				c_memmove (c_offset_pointer ($a_buffer, new_pos), c_offset_pointer ($a_buffer, old_pos), nb)
			end
		end

	move_right (a_buffer: like STRING_BUFFER_TYPE; old_pos, new_pos: INTEGER; nb: INTEGER) is
			-- Copy `nb' characters from `old_pos' to
			-- `new_pos' in `a_buffer'.
		require
			a_buffer_not_void: a_buffer /= Void
			nb_positive: nb >= 0
			old_pos_large_enough: old_pos >= lower
			enough_characters: (old_pos + nb - 1) <= upper (a_buffer)
			new_pos_large_enough: new_pos >= lower
			enough_space: (new_pos + nb - 1) <= upper (a_buffer)
			move_right: old_pos < new_pos
		do
			if nb > 0 then
				c_memmove (c_offset_pointer ($a_buffer, new_pos), c_offset_pointer ($a_buffer, old_pos), nb)
			end
		end

feature -- Resizing

	resize (a_buffer: like STRING_BUFFER_TYPE; n: INTEGER): like STRING_BUFFER_TYPE is
			-- Resize `a_buffer' so that it contains `n' characters.
			-- Do not lose any previously entered characters.
			-- Note: the returned string buffer might be `a_buffer' or
			-- a newly created string buffer where characters from
			-- `a_buffer' have been copied to.
		require
			a_buffer_not_void: a_buffer /= Void
			n_large_enough: n >= a_buffer.count
		do
			Result := c_str_resize ($a_buffer, n)
		ensure
			string_buffer_not_void: Result /= Void
			count_set: Result.count = n
		end

feature {NONE} -- Externals

	c_str_resize (a: POINTER; newsize: INTEGER): SPECIAL [CHARACTER] is
			-- Area which can accomodate at least `newsize' characters
		external
			"C | %"eif_malloc.h%""
		alias
			"sprealloc"
		end

	c_file_gss (a_file: POINTER; a_string: POINTER; length: INTEGER): INTEGER is
			-- Read min (`length', remaining bytes in `a_file')
			-- characters into `a_string'.
		external
			"C (FILE *, char *, EIF_INTEGER): EIF_INTEGER"
		alias
			"file_gss"
		end

	c_console_readstream (a_file: POINTER; a_string: POINTER; length: INTEGER): INTEGER is
			-- Read a stream from the console
		external
			"C (FILE *, char *, EIF_INTEGER): EIF_INTEGER"
		alias
			"console_readstream"
		end

	c_memcpy (target, source: POINTER; size: INTEGER) is
			-- Copy `size' characters from `source' to `target'.
			-- `source' and `target' should not overlap.
		external
			"C (void *, void *, size_t) | <string.h>"
		alias
			"memcpy"
		end

	c_memmove (target, source: POINTER; size: INTEGER) is
			-- Copy `size' characters from `source' to `target'.
			-- `source' and `target' can overlap.
		external
			"C (void *, void *, size_t) | <string.h>"
		alias
			"memmove"
		end

	c_offset_pointer (p: POINTER; offset: INTEGER): POINTER is
		external
			"C [macro <ise_gobo.h>]"
		alias
			"STRING_OFFSET_POINTER"
		end

	c_str_set_count (a_string: POINTER; n: INTEGER) is
			-- Call `set_count' from STRING
		external
			"C [macro <eif_project.h>]"
		alias
			"(egc_strset)"
		end

end -- class KL_STRING_BUFFER_ROUTINES
