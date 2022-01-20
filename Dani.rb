puts "Scraper Ruby"
require 'open-uri'
require 'nokogiri'
class Dani
  @lenguajes
  @dinero
  def initialize (link)
    peliculas = URI.open(link)
    datos = peliculas.read
    parsed_content = Nokogiri::HTML(datos)
    @lenguajes=parsed_content.css(".mtr-table").css('.mtr-td-tag')
    contador=0
    @lenguajes.each do |row|
       
        if(row.attribute('data-mtr-content').inner_text=="POSICIÓN")
            puts 'pos'
            puts row.css('.mtr-cell-content').inner_text
            contador+=1
        end
        if(row.attribute('data-mtr-content').inner_text=="NÚMERO DE VALORACIONES")
            puts 'numero de valor'
            puts row.css('.mtr-cell-content').inner_text
            contador+=1
        end
        if(row.attribute('data-mtr-content').inner_text=="CATEGORÍA")
            puts 'categoria'
            puts row.css('.mtr-cell-content').inner_text
            contador+=1
        end
       
    end
        puts "estas son las vuetlas #{contador}"
  end
  def metodoPrincipal()
    puts "prueba"
    end
           
end