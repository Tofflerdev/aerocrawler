require 'open-uri'
require 'nokogiri'
require 'json'



doc = Nokogiri::HTML(open('https://www.avito.ru/moskva/odezhda_obuv_aksessuary/zhenskaya_odezhda?q=%D1%81%D0%B2%D0%B0%D0%B4%D0%B5%D0%B1%D0%BD%D0%BE%D0%B5%20%D0%BF%D0%BB%D0%B0%D1%82%D1%8C%D0%B5&sgtd=2'))


doc.css('.description .about').each do |item|

puts item.content

end



#doc.at_css('[id = "tariffsTable"]').css('.directions__item').each do |item|

#puts item.css('.directions__to').text

#end