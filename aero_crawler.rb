require 'open-uri'
require 'nokogiri'
require 'watir'
require 'json'


browser = Watir::Browser.new
browser.goto 'https://www.aeroflot.ru/ru-ru/destination_offers'

doc = Nokogiri::HTML(browser.html)

arr = []

doc.css('.directions__item').each do |item|

from = item.at_css('.directions__from').content.strip
to = item.at_css('.directions__to').content.strip
price = item.at_css('.directions__price').content.strip
tariff = item.at_css('.directions__tariff').content.strip
date = item.at_css('.directions__date').content.strip

arr << {
:from => from,
:to => to,
:price => price,
:tariff => tariff,
:date => date,
}

end

arr.each do |item|

puts "#{item[:from]},#{item[:to]},#{item[:price]},#{item[:tariff]},#{item[:date]}"

end


#doc.css('.directions__to').each do |item|


#puts item.content

#end



#doc.at_css('[id = "tariffsTable"]').css('.directions__item').each do |item|

#puts item.css('.directions__to').text

#end