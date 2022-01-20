puts "Scraper Ruby"
require 'open-uri'
require 'nokogiri'
require './Lenguaje.rb'
class DavidBravo
  @lenguajes
  @dinero
  def initialize (link)
    peliculas = URI.open(link)
    datos = peliculas.read
    parsed_content = Nokogiri::HTML(datos)
    #@galeria = parsed_content.css('#section-experience-years-coding').css('.ai-start').css('.fl1').css('.fc-white').inner_text
    @lenguajes = parsed_content.css('#section-most-popular-technologies-programming-scripting-and-markup-languages')
    @lenguajes=@lenguajes.css('.bt').css('#most-popular-technologies-language').css('#language').css('.label')
    @lenguajes.each do|block|
      #puts block.inner_text
    end
    @dinero=parsed_content.css('#section-salary-salary-and-experience-by-language').css('.bt').css('.overflow-x-auto').css('.ds-chart').attribute('data-json').value
    dataCleaned=[]
    listaLenguaje=@dinero[11..-2].split("response").each do |element|
      caja=element.split("}")[0]
      dataCleaned << caja
    end
    lenguajeObjeto=[]
    puts "inicio"
    dataCleaned.each do|i|
      specificData=i.split(",")
      lenguajeObjeto << Lenguaje.new(specificData[0][1..-1],specificData[2][4..],specificData[3][4..])
    end
    
    lenguajeObjeto.each do |objetos|
      puts ' '
      objetos.print
    end
  end
  def metodoPrincipal()
    puts "hola"
      # @galeria.each do|publicaciones|
      # puts publicaciones
      # end
    end 
            
end