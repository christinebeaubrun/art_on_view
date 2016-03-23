# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nokogiri'
require 'open-uri'

file = File.open( "./city_museums_exhibitions_url.txt", "r" ) { | file | file.read }
		data = eval(file)

		data.each { |city|

			new_city = City.create( { name: city[:city_name] } )
			city[:museums].each { | museum |
				new_museum_hash = { name: museum[:name], location: museum[:location], city: new_city}
				new_museum = Museum.create( new_museum_hash )

				museum[:exhibitions].each { | exhibition |
					exhibition_hash = {}
					prefix = exhibition[:css_img_prefix] || ""

					html = Nokogiri::HTML( open( exhibition[:url] ) )
					exhibition_hash[:name] = html.css( exhibition[:css_title] ).text
					exhibition_hash[:exhibit_date] = html.css( exhibition[:css_date] ).text
					exhibition_hash[:img_url] = prefix + html.css( exhibition[:css_img_url] ).attribute("src").value
					exhibition_hash[:about_url] = exhibition[:url]
					exhibition_hash[:museum] = new_museum

					new_exhibition = Exhibition.create( exhibition_hash )
				}
			}
		}
