
class TEST
inherit	
	TEST1
		redefine
			value, anchor
		end

create
	make

feature

	make
		local
			t2: TEST2 [TEST, TEST1]
		do
			print (value)
			create t2.make
		end

	value: like anchor
		local
			t: TUPLE [like anchor]
		do
			t := [Precursor]

			print (t.generating_type)
			io.put_new_line

			print (([Precursor]).generating_type)
			io.put_new_line

			print ((<< Precursor >>).generating_type)
			io.put_new_line
		end

	anchor: STRING

end

