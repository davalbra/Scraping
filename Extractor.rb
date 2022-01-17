require 'open-uri'
require 'nokogiri'
require 'csv'

class Extractor
  @parsed_content

  def initialize(link)
    info = URI.open(link)
    datos = info.read
    @parsed_content = Nokogiri::HTML(datos)
    puts("hola")
    puts("hola de nuevo")
  end

  
  def obtener()
    CSV.open('SistemaOperativo.csv', 'wb') do |csv|
      csv << %w[SO Porcentaje]

      extract = @parsed_content.css('div.wt-row.wt-row_size_m').each do |etiqueta|
        sistema_operativo = etiqueta.css('div.wt-col-inline.wt-offset-top-12').css('div.wt-col-inline.wt-offset-top-12').css('display').css('chartbox').css('slice').inner_text

        
        porcentaje = etiqueta.css('div.wt-col-inline.wt-offset-top-12').css('slice').css('valueLabel').css('tspan').inner_text

        csv << [sistema_operativo, porcentaje]
      end
    end
  end
end
