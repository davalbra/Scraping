require 'nokogiri'

puts "Scraper StackOverflow"
require 'open-uri'
require 'nokogiri'
require 'csv'
require './Extractor.rb'
require './extractorContribution.rb'

linkGithub = "https://octoverse.github.com/"
linkPush1 = "https://madnight.github.io/githut/#/pushes/2021/1"
linkPush4 = "https://madnight.github.io/githut/#/pushes/2021/4"



p1 = Extractor.new(linkGithub)
p2 = ExtractorContribution.new(linkPush1)

p1.obtener()

