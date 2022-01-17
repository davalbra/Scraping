puts "Scraper StackOverflow"
require 'open-uri'
require 'nokogiri'
require 'csv'
require './Extractor.rb'

link = "https://www.jetbrains.com/es-es/lp/devecosystem-2021/"

p1 = Extractor.new(link)
puts p1
p1.obtener()