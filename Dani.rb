puts "Scraper Ruby"
require 'open-uri'
require 'nokogiri'
require 'csv'
 
class Dani
  @lenguajes
  @guardarposicion=[]
  @posicion = ""
  @curso = ""
  @valoraciones= "" 
  @categoria= ""

  
  def initialize (link)
    leer_html = URI.open(link)
    datos = leer_html.read
    parsed_content = Nokogiri::HTML(datos)
    @lenguajes=parsed_content.css(".mtr-table").css('.mtr-td-tag')

  end

    
    
    def metodoPrincipal()
        contador=0
        CSV.open('datos.csv', 'wb') do |csv|
            csv << %w[posicion curso valoraciones categoria]   
        @lenguajes.each do |row| 
            contador+=1

                if(row.attribute('data-mtr-content').inner_text=="POSICIÓN")
                    puts 'posicion: '
                    @posicion= row.css('.mtr-cell-content').inner_text
                    
                end
                if(row.attribute('data-mtr-content').inner_text=="NÚMERO DE VALORACIONES")
                    puts 'numero de valor'
                    @valoraciones= (row.css('.mtr-cell-content').inner_text).gsub(/[[:space:]]+/, "")
                    
                end
                if(row.attribute('data-mtr-content').inner_text=="NOMBRE DEL CURSO")
                    puts 'Curso: '
                    @curso= row.css('.mtr-cell-content').inner_text
                end
                if(row.attribute('data-mtr-content').inner_text=="CATEGORÍA")
                    puts 'categoria&nbsp'
                    @categoria= row.css('.mtr-cell-content').inner_text
                    if(contador>8)
                        csv << [@posicion.strip,@curso.strip,@valoraciones,@categoria.strip]
                    end
                end
                

            end  
        end
    end
end

