# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'
unit_ids = ['Necrons', 'Tyranids', 'Orks', 'Adeptus_Mechanicus', 'Eldar', 'Dark_Eldar', 'Tau', 'Death_Guard', 'Genestealer_Cults', 'Chaos_Space_Marines', 'Blood_Angels', 'Grey_Knights']
# for id in unit_ids do
#     unit_html = open("https://1d4chan.org/wiki/Warhammer_40,000/Tactics/Necrons(8E)");
#     unit_doc = Nokogiri::HTML(unit_html)
#     unit_doc.children.each do |p|
#         if(p.css('div#mw-content-text'))
#             p.children.each do |e|
#                 if(e.css('span#Unit_Analysis'))
#                     puts(e.text)
#                 end
#             end
#         end
#     end
    # unit_desc = unit_doc.css('div#mw-content-text')
    # puts(unit_desc)
    # unit_desc.each do |p|
    #     puts(p)
    # end
# end

unit_html = open("https://1d4chan.org/wiki/Warhammer_40,000/Tactics/Necrons(8E)");
unit_doc = Nokogiri::HTML(unit_html)
open('test.txt', 'w') { |f|
    h2prev = false
    h2next = false
    # c = unit_doc.css('span#Unit_Analysis')
    # c.each do |d|
    #     f.puts d.attributes
    # end
    unit_desc = unit_doc.css('div#mw-content-text')
    unit_desc.children.each do |p|
        if (h2prev && p.name == 'h2')
            h2next = true
        end

        if (h2prev && !h2next) 
            if (p.content.include?(':'))
                p.children.each do |e|
                    f.puts e.content
                end
            end
        end

        if (p.content == 'Unit Analysis[edit]')
            h2prev = true
        end

        

        # e = p.css('li')
        # e.each do |c|
        #     if c.previous='h3'
        #         f.puts c
        #     end
        # end
    end
}


# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?