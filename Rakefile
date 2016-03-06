# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks
require 'nokogiri'
require 'open-uri'

namespace :db do
	task :seed do
		file = File.open( "city_museums_exhibitions_url.txt", "r" ) { | file | file.read }
		data = eval(file)

		data.each { |city|
			new_city = City.create( city[:city_name] )
			city[:museums].each { | museum |
				new_museum = Museum.create({ name: museum[:name], location: museum[:location], city_id: new_city.id})

				museum[:exhibitions].each { | exhibition |
					exhibition = {}
					prefix = exhibition[:css_img_prefix] || ""

					html = Nokogiri::HTML( open( exhibition[:url] ) )
					exhibiton[:title] = html.css( exhibition[:css_title] ).text
					exhibiton[:exhibit_date] = html.css( exhibition[:css_date] ).text
					exhibiton[:about_url] = exhibition[:url]
					exhibition[:img_url] = prefix + html.css( exhibition[:css_img_url] ).attribute("src").value
					exhibition[:museum_id] = new_museum.id

					new_exhibition = Exhibition.create( exhibition )
				}
			}
		}
	end
end
