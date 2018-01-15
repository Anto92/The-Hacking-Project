def chiffre_de_cesar(str, key)
	@str = str
	@key = key
	array = str.chars
	
	array.each do |curr_char|
	 if (curr_char.ord >= 65 && curr_char.ord < 91)
	 	print (((curr_char.ord + key - 65) % 26) + 65).chr
	 elsif (curr_char.ord >= 97 && curr_char.ord < 123)
	 	print (((curr_char.ord + key - 97) % 26) + 97).chr
	 else
	 	print curr_char
	end
end
end

chiffre_de_cesar("ABC abc xyz XYZ 123 éé", 1)

