require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'pry'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"

def crypto_trader
	crypto_names = []
	crypto_price = []
	my_hash = Hash.new
	page = Nokogiri::HTML(open(PAGE_URL))
	i = 0

	page.css('.currency-name-container').each do |elem|
		crypto_names << elem.text
	end

	page.css('.price').each do |p|
		crypto_price << p.text
	end

	size = crypto_names.length

	while i < size do
		my_hash[crypto_names[i]] = crypto_price[i]
		i += 1
	end
	puts my_hash
end

crypto_trader