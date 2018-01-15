x = 0
(1..999).each do |num|
	x = x + num if (num % 3 == 0) || (num % 5 == 0) 
end

puts x
