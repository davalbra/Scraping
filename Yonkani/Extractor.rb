require 'open-uri'
require 'nokogiri'
require 'csv'

class Extractor
  @parsed_content

  def initialize(link)
    info = URI.open(link)
    datos = info.read
    @parsed_content = Nokogiri::HTML(datos)
  end

  
  def obtener()
    CSV.open('continentes.csv', 'wb') do |csv|
      csv << %w[SO Porcentaje]
      contador = 0
      #extract = @parsed_content.css('.DefaultLayout').css('.ScrollToItem').css('.styles_PageSection__2O4NI').css('.mx-auto.max-w-screen-xl.px-6').css('.css-sanqhm').css('.border-t.border-octo-gray-medium.my-8').css('.flex.border-b.border-octo-gray-medium.py-7.flex-wrap').css('.w-full.pb-6').css('.styles_BodyText__1Ue9b').css('strong').each do |continentes|
       # puts continentes.inner_text

      #end
      extract2 = @parsed_content.css('.DefaultLayout').css('.ScrollToItem').css('.styles_PageSection__2O4NI').css('.mx-auto.max-w-screen-xl.px-6').css('.css-sanqhm').css('.border-t.border-octo-gray-medium.my-8').each do |porcentaje|
        continentes porcentaje.css('.flex.border-b.border-octo-gray-medium.py-7.flex-wrap').css('.w-full.pb-6').css('.styles_BodyText__1Ue9b').css('strong').inner_text
        porcent = porcentaje.css('.w-full').css('.styles_ChartBarInline__ZXWLP').css('.styles_ChartBarInline_bar__3DAmB').css('.styles_ChartBarInline_value__1Vrvv').inner_text
      end
      #puts extract2
    end
  end

  def obtenerDatosTrabajo()
    CSV.open('trabajo.csv', 'wb') do |csv|
      csv << %w[Presencial Hibrido Remoto]
      extract3 = @parsed_content.css('.DefaultLayout').css('#improving-how-we-work').css('.styles_PageSection__2O4NI').css('.mx-auto.max-w-screen-xl.px-6').css('.css-sanqhm').css('.styles_ChartButterfly__zfTi6').css('.w-full').each do |titulos|
        derecha = titulos.css('.text-right').inner_text
        izquerda = titulos.css('.text-left').inner_text
        puts titulos.css('tr').css('td').css('.styles_ChartBarInline__ZXWLP').css('.styles_ChartBarInline_bar__3DAmB').css('.styles_ChartBarInline_value__1Vrvv').inner_text
      end

    end
  end

  

end