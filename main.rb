puts "Scraper Ruby"
require_relative './David/DavidBravo.rb'
require './Dani.rb'

 
linkDavidBravo="https://insights.stackoverflow.com/survey/2021"
linkDani="https://aulapro.co/especiales-aulapro/los-100-mejores-cursos-de-coursera-de-todos-los-tiempos/"
 
# scrapDani=Dani.new(linkDani)
# scrapDani.metodoPrincipal


scrapDavidBravo=DavidBravo.new(linkDavidBravo)
scrapDavidBravo.metodoPrincipal