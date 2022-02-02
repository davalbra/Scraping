require 'open-uri'
require 'nokogiri'
require './David/Lenguaje.rb'
require './David/Ranking.rb'
require './David/JoinRankingLenguaje.rb'
require 'csv'
class DavidBravo
  @lenguajes
  @dinero
  def initialize (link)
    peliculas = URI.open(link)
    datos = peliculas.read
    parsed_content = Nokogiri::HTML(datos)
    #@galeria = parsed_content.css('#section-experience-years-coding').css('.ai-start').css('.fl1').css('.fc-white').inner_text
    @lenguajes = parsed_content.css('#section-most-popular-technologies-programming-scripting-and-markup-languages')
    @dinero=parsed_content.css('#section-salary-salary-and-experience-by-language').css('.bt').css('.overflow-x-auto').css('.ds-chart').attribute('data-json').value
    
  end
  #crea objetos a partir de los ranking de los lenguajes---------------
  def rankingsProgram()
    @lenguajes=@lenguajes.css('.bt').css('#most-popular-technologies-language').css('#language').css('.label')
    lenguajeObjeto=[]
    contador=0
    @lenguajes.each do|block|
      contador+=1
      lenguajeObjeto << Ranking.new(block.inner_text,contador)
    end

   return lenguajeObjeto
  end
    #crea objetos a partir de los lenguajes y sus sueldos anuales---------------

  def lenguajesDeProgramacion()
    dataCleaned=[]
    listaLenguaje=@dinero[11..-2].split("response").each do |element|
      caja=element.split("}")[0]
      dataCleaned << caja
    end
    lenguajeObjeto=[]
    puts "inicio"
    dataCleaned.each do|i|
      specificData=i.split(",")
      lenguajeObjeto << Lenguaje.new(specificData[0][3..-2],specificData[2][4..],specificData[3][4..],specificData[1][12..])
    end
    return lenguajeObjeto
   

  end
  #metodo principal
  def metodoPrincipal()
    arrLengua=lenguajesDeProgramacion
    arrRanking =rankingsProgram
    #print(lenguajesDeProgramacion)
    #print(rankingsProgram)
    lenguajeObjeto=[]
    for i in(0..arrLengua.size()-1)
      for e in(0..arrRanking.size()-1)
        if(arrLengua[i].nombre == arrRanking[e].nombre)
          lenguajeObjeto << JoinRankingLenguaje.new(arrRanking[e].nombre,arrRanking[e].rankin,arrLengua[i].dinero,arrLengua[i].tiempo,arrLengua[i].encuesta)

        end
      end
    end
    print(lenguajeObjeto)
    CSV.open('Busqueda.csv', 'wb') do |csv|
      csv << %w[Nombre,Ranking,Dinero,Tiempo,Encuesta]
      for i in(0..lenguajeObjeto.size()-1)
        csv << [lenguajeObjeto[i].nombre,lenguajeObjeto[i].rankin,lenguajeObjeto[i].dinero,lenguajeObjeto[i].tiempo,lenguajeObjeto[i].encuesta]
      end
      
    end
            
    
  end

    def print (coleccion)
        coleccion.each do |objetos|
        puts ' '
        objetos.print
      end
    end
end