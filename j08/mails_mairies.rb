require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'pry'

PAGE_URL = "http://annuaire-des-mairies.com/95/vaureal.html"

def get_the_email_of_a_townhal_from_its_webpage
	page = Nokogiri::HTML(open(PAGE_URL))

links = page.css("tr td p font")
links.each do |link|
	if link.text.include?("@")
		puts link.text
	end
end
# binding.pry
end

get_the_email_of_a_townhal_from_its_webpage