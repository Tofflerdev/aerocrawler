require 'open-uri'
require 'nokogiri'
require 'watir'
require 'json'


browser = Watir::Browser.new
browser.goto 'https://www.aeroflot.ru/ru-ru/destination_offers'

doc = Nokogiri::HTML(browser.html)


doc.css('.directions__to').each do |item|


puts item.content

end



#doc.at_css('[id = "tariffsTable"]').css('.directions__item').each do |item|

#puts item.css('.directions__to').text

#end