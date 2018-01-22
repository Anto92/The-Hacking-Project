require 'watir'
require 'pry'

browser = Watir::Browser.new(:firefox)
browser.goto 'google.com'

search_bar = browser.text_field(id: 'lst-ib')
search_bar.set("Hello World!")

# méthode touche entrée
search_bar.send_keys(:enter)

# méthode du clic
# submit_button = browser.button(name: "btnK")
# submit_button.click

browser.driver.manage.timeouts.implicit_wait = 3

search_result_divs = browser.divs(class:"rc")
search_result_divs.each { |div| p div.h3.text }
binding.pry

p "Méfait accompli, fermeture du browser"
browser.close