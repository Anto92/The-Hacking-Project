class Book
# write your code here
attr_accessor :title

def title=(value)
	@title = titleize(value)
end

	def titleize(title)
		words_to_lower = ["the", "a", "an", "and", "in", "of"]
		full_title = title.split(" ").each do |curr_word|
		if words_to_lower.include?(curr_word) then curr_word.downcase!
		else curr_word.capitalize!
		end
	end
	full_title[0].capitalize!
	full_title.join(" ")
	end
end

# my_book = Book.new
# my_book.title = "des fleurs pour algernon"
# puts my_book.title

# my_other_book = Book.new
# my_other_book.title = "the man in the iron mask"
# puts my_other_book.title