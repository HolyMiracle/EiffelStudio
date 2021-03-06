class A

create
	default_create,
	make

feature {NONE} -- Creation

	make (value: TEST)
			-- Raise an exception after registering `value` in a once function.
		do
				-- No qualified calls can be made, only reference comparison and boolean tests.
			check f (value) = Void then end
		end

feature -- Access

	f (value: TEST): TEST
			-- A once function returning an incompletely initialized object
			-- if `value` was incompletely initialized at the first call.
		once
			Result := value
		end

end
