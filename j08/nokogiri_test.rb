require 'rubygems'
require 'nokogiri'   
require 'open-uri'

#PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"
# page = Nokogiri::HTML(open("index.html"))

# links = page.css("div a img")
# links.each do |link|
# 	puts link
# end

PAGE_URL = "https://en.wikipedia.org/wiki/HTML"
page = Nokogiri::HTML(open(PAGE_URL))

page.css('div#content div#bodyContent table.infobox tr th').each do |el|
   puts el.text
end


# links = page.css("div#references a")
# links.each do |link| 
#  	 puts "#{link.text}\t#{link['href']}"
#  end


# links = page.css("a")
# puts links.length   

# puts links[0].text  
# puts links[0]["href"]
# puts

# puts links[1].text  
# puts links[1]["href"]
# puts

# puts links[2].text  
# puts links[2]["href"]


# Va chopper tous les tags <a> de la page html ayant la valeur "news" pour "data-category" et les selectionne
# news_links = page.css("a").select do |link| 
# 	link['data-category'] == "news"
# end

# # Display les elements qu'on a selectionné
# news_links.each do |link| 
# 	puts link['href'] 
# end


# news_links = page.css("a[data-category=news]")
# news_links.each do |link| 
# 	puts link['href']
# end

# puts news_links.class


