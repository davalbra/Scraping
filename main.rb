require './DavidBravo.rb'
menu = "Menu Scrapeando v0.01
a. Top 10
b. Top 100
c. Todas las películas
d. Extraer por palabra clave
e. Salir"


link="https://insights.stackoverflow.com/survey/2021"
scrap=DavidBravo.new(link)
scrap.metodoPrincipal