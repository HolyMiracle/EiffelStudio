indexing
	description: "[
		Test for basic types to show that their implementation by the compiler is correct and
		that also when assigned to a reference entity the dynamic binding works properly as well.
		]"

class TEST

create
	make

feature

	make is
		local
			l_c: TEST1 [PATH_NAME, FILE_NAME]
		do
		end

end
