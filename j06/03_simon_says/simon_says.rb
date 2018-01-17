#write your code here
def echo(str)
	str
end

def shout(str)
	str.upcase
end

def repeat(str, iter=2)
	((str + " ") * iter).rstrip
end

def start_of_word(user_name, num)
	(user_name.chars[0..num - 1]).join.to_s
end

def first_word(words)
	words.partition(" ").first
end

def titleize(title)
	full_title = title.split(" ").each do |word|
		if word.length < 4 then word.downcase!
		else word.capitalize!
		end
	end
	full_title[0].capitalize!
	full_title.join(" ")
end
