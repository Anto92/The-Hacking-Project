require 'nokogiri'
require 'open-uri' 

class ScrapCrypto

	def initialize
		@page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
		@cryptos = Hash.new
	end

	def get_crypto_data

		@crypto_names = []
	    @page.css('.currency-name-container').each do |elem|
			@crypto_names << elem.text
		end

		@crypto_prices = []
	    @page.css('.price').each do |elem|
			@crypto_prices << elem.text
		end

		i = 0
		size = @crypto_names.length

		while i < size do
			@cryptos[@crypto_names[i]] = @crypto_prices[i]
			i += 1		
	    end
	    @cryptos
	end
end