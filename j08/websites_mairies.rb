require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'pry'

PAGE_URL = "http://annuaire-des-mairies.com/val-d-oise.html"

def get_the_email_of_a_townhal_from_its_webpage(url)
	page = Nokogiri::HTML(open(url)) # Passer en URL la value du hash de l'autre programme

	links = page.css("tr td p font")
	links.each do |elem|
		if elem.text.include?("@")
			puts elem.text
		end
	end
# binding.pry
end

def get_all_the_urls_of_val_doise_townhalls(url)
	page = Nokogiri::HTML(open(url))
	website = Hash.new
	test_hash = Hash.new

	links = page.css(".lientxt")
	links.each do |elem|
		clean_link = "http://annuaire-des-mairies.com" + elem['href'][1..-1]
		test_hash[elem.text] = clean_link
		website[elem.text] = get_the_email_of_a_townhal_from_its_webpage(clean_link)	
	end
	# puts test_hash # Uncomment ca pour display le Hash
end

get_all_the_urls_of_val_doise_townhalls(PAGE_URL)

#get_the_email_of_a_townhal_from_its_webpage(PAGE_URL)

