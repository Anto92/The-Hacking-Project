require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'pry'

PAGE_URL = "http://annuaire-des-mairies.com/val-d-oise.html"

def get_the_email_of_a_townhal_from_its_webpage
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))

	links = page.css("tr td p font")
	links.each do |link|
		if link.text.include?("@")
			puts link.text
		end
	end
# binding.pry
end

def get_all_the_urls_of_val_doise_townhalls
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

	links = page.css(".lientxt")
	links.each do |link|
		clean_link = link['href'][1..-1] 
		puts "annuaire-des-mairies.com" + clean_link
	end
end

get_all_the_urls_of_val_doise_townhalls

# get_the_email_of_a_townhal_from_its_webpage

