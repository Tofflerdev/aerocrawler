require 'open-uri'
require 'nokogiri'
require 'watir'
require 'json'


browser = Watir::Browser.new
browser.goto 'https://www.aeroflot.ru/ru-ru/destination_offers'

doc = Nokogiri::HTML(browser.html)

#создаем массив
arr = []

#обрабатываем каждое предложение
doc.css('.directions__item').each do |item|

from = item.at_css('.directions__from').content.strip #забираем направление from
to = item.at_css('.directions__to').content.strip #забираем направление to
price = item.at_css('.directions__price').content.strip #забираем цену
tariff = item.at_css('.directions__tariff').content.strip#забираем тариф
date = item.at_css('.directions__date').content.strip#забираем дату

#добавляем собранную инфу в массив, хеш == предложение
arr << {
:from => from,
:to => to,
:price => price,
:tariff => tariff,
:date => date,
}

end

#выводим инфу в строку по ключам
arr.each do |item|

puts "#{item[:from]},#{item[:to]},#{item[:price]},#{item[:tariff]},#{item[:date]}"

end