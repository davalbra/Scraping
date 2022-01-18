link = "https://aulapro.co/especiales-aulapro/los-100-mejores-cursos-de-coursera-de-todos-los-tiempos/"

 def self.data_from_link(link)
        doc = Nokogiri::HTML(open(link))
        @occurances = []
        doc.xpath("//tr").each do |x|
          posicion = doc.x("td")[0].text
          nombre_curso = doc.x("td")[1].text
          calificacion = doc.x("td")[2].text
          valoraciones = doc.x("td")[4].text
          categoria = doc.x("td")[5].text
          source = doc.search(".links li.last a").attr("href").value
          @occurances << {:posicion => posicion, :nombre_curso => nombre_curso, :calificacion => calificacion, :valoraciones => valoraciones, :categoria => categoria, :source => source}
        end
        puts @occurances
      end
  
puts "Fin de práctica"
