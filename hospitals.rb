require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://www.hospitalsafetygrade.org/all-hospitals'

html = URI.open(url)
doc = Nokogiri::HTML(html)

hospital_names = []
doc.css('div#BlinkDBContent_849210 ul li a').each do |hospital|
  hospital_names << hospital.text
end

CSV.open('hospitals.csv', 'w') do |csv|
  csv << ['ID', 'Hospital Name']

  id = 1

  hospital_names.each do |hospital_name|
    csv << [id, hospital_name]

    id += 1
  end
end
