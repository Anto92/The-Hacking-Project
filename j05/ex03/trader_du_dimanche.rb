def find_best_prices(a)
	best_price = a[1] - a[0]

	for i in (0..a.length)
		for j in ((i+1)..a.length)
			if (a[j].to_i - a[i].to_i > best_price)
				best_price = a[j].to_i - a[i].to_i
				prix_max = i
				prix_min = j
			end
		end
	end
	puts "[#{prix_max}, #{prix_min}]"
end

a = [17,3,6,9,15,8,6,1,10]
print find_best_prices([17,3,6,9,15,8,6,1,10])