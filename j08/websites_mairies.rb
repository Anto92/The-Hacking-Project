require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

PAGE_URL = "http://annuaire-des-mairies.com/val-d-oise.html"

def get_the_email_of_a_townhal_from_its_webpage(url)
    page = Nokogiri::HTML(open(url))
    find_mails = page.xpath('//html/body/table/tr[3]/td/table/tr[1]/td[1]/table[4]/tr[2]/td/table/tr[4]/td[2]/p')
    find_mails.each do |mail|
        return mail.text
    end
end

def get_all_the_urls_of_val_doise_townhalls(url)
    page = Nokogiri::HTML(open(url))
    table = []
    url_catch = page.css(".lientxt")
    url_catch.each  do |city|
        relative_url = "http://annuaire-des-mairies.com" + city['href'][1..-1]
        hashing = Hash.new
        
        hashing["city_name"] = city.text
        hashing["city_email"] = get_the_email_of_a_townhal_from_its_webpage(relative_url)
        table << hashing
    end
    return table     
end
get_all_the_urls_of_val_doise_townhalls(PAGE_URL)

