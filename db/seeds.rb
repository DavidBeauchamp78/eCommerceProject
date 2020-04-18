# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "nokogiri"
require "open-uri"

Figure.destroy_all
Province.destroy_all

unit_ids = ["Necrons", "Eldar", "Dark_Eldar", "Genestealer_Cults", "Grey_Knights"]
unit_ids.each do |id|
  unit_html = open("https://1d4chan.org/wiki/Warhammer_40,000/Tactics/#{id}(8E)")
  unit_doc = Nokogiri::HTML(unit_html)
  h2prev = false
  h2next = false
  unit_desc = unit_doc.css("div#mw-content-text")
  faction = Faction.create(
    name: id.to_s
  )
  unit_desc.children.each do |p|
    h2next = true if h2prev && p.name == "h2"

    if h2prev && !h2next
      p.search(".//ol").remove
      p.search(".//ul").remove
      unit = p.css("li")
      unit.each do |e|
        stuff = e.content.split(":", 2)
        # f.puts e
        name = stuff[0].to_s
        unless !name.include?("(") && !name.include?(")") && !name.include?("[") && !name.include?("]") && !name.include?("Note")
          next
        end

        desc = stuff[1]
        faction.figures.create(
          name:        name,
          description: desc,
          price:       rand(5..50).to_i
        )
      end
    end

    h2prev = true if p.content == "Unit Analysis[edit]"
  end
end

Province.create(name: "British Columbia", PST: 0.07, GST: 0.05, HST: 0.00)
Province.create(name: "Alberta", PST: 0.00, GST: 0.05, HST: 0.00)
Province.create(name: "Saskatchewan", PST: 0.05, GST: 0.05, HST: 0.00)
Province.create(name: "Manitoba", PST: 0.07, GST: 0.05, HST: 0.00)
Province.create(name: "Ontario", PST: 0.00, GST: 0.00, HST: 0.13)
Province.create(name: "Quebec", PST: 0.095, GST: 0.05, HST: 0.00)
Province.create(name: "New Brunswick", PST: 0.00, GST: 0.00, HST: 0.13)
Province.create(name: "Nova Scotia", PST: 0.00, GST: 0.00, HST: 0.15)
Province.create(name: "Newfoundland and Labrador", PST: 0.00, GST: 0.00, HST: 0.15)
Province.create(name: "Prince Edward Island", PST: 0.00, GST: 0.00, HST: 0.15)
Province.create(name: "Nova Scotia", PST: 0.00, GST: 0.00, HST: 0.15)
Province.create(name: "Northwest Territories", PST: 0.05, GST: 0.00, HST: 0.00)
Province.create(name: "Yukon", PST: 0.05, GST: 0.00, HST: 0.00)
Province.create(name: "Nunavit", PST: 0.05, GST: 0.00, HST: 0.00)

# AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password") if Rails.env.development?
