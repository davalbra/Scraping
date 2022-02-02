require 'open-uri'
require 'nokogiri'
require 'csv'

class ExtractorContribution
    @parsed_content

    def initialize(link)
        info = URI.open(link)
        datos = info.read
        @parsed_content = Nokogiri::HTML(datos)
    end

    def obtenerContribucion()
        CSV.open('contribucionPrimerCuarto.csv', 'wb') do |csv|
            csv << %w[Ranking ProgrammingLanguage Percentage]

            obtenerPushes = @parsed_content.css('#root').css('div').each do |etiqueta|
                contador = 0
                array = []
                etiqueta.css('.react-bs-table-container').css('.react-bs-table').css('.react-bs-container-body').css('.table.table-striped.table-condensed').css('tbody').css('tr').css('td').each do |value|
                    puts '----'
                    puts contador
                    puts value.inner_text.strip
                    if contador == 2
                        array.push(value.inner_text.strip)
                        str = array.join(',')
                        csv << [str]
                        array = []      
                        contador = 0
                    else
                        array.push(value.inner_text.strip) 
                        contador += 1
                    end       
                end
            end
        end
    end
end
