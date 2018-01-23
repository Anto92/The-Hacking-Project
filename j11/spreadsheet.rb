require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'google_drive'
require 'gmail'
require 'io/console'
require 'pry'


def get_credentials
    print "What's your mail ? : "
    @mail = gets.chomp
    print "What's your pass ? : "
    @pass = STDIN.noecho(&:gets).chomp

    @gmail = Gmail.connect(@mail, @pass)
end

def send_mail(curr_email)

    email = @gmail.compose do
      to curr_email
      subject "Infos THP"
      body "Bonjour,
Je m'appelle Antonin, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.

Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec vous !

Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
    content_type 'text/plain; charset=UTF-8'
    end
    #binding.pry
    sleep(1.2)
    email.deliver!
end


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
    @table = []
    url_catch = page.css(".lientxt")
    url_catch.each  do |city|
        relative_url = "http://annuaire-des-mairies.com" + city['href'][1..-1]
        hashing = Hash.new
        
        hashing["city_name"] = city.text
        hashing["city_email"] = get_the_email_of_a_townhal_from_its_webpage(relative_url)
        @table << hashing
    end 
    return @table     
end
get_all_the_urls_of_val_doise_townhalls(PAGE_URL)

session = GoogleDrive::Session.from_config("config.json")
ws = session.spreadsheet_by_key("1ks56g2cC7uvwSiqviNskDqy0gRwki6ecSEaOoGauM9Y").worksheets[0]
i = 1
j = 1

get_credentials

while i <= @table.length
    ws[i,1] = @table[i-1]["city_name"] 
    i += 1
end

while j <= @table.length
    ws[j,2] = @table[j-1]["city_email"]
    # puts ws[j,2] # M'affiche tous les mails
    #send_mail(@table[j-1]["city_email"])
    send_mail("antonin.siguierfr@gmail.com") # TESTING
    j += 1
end
ws.save

@gmail.logout

# Tout le code au dessus me permet d'avoir ma spreadsheet, maintenant, il faut envoyer les mails




