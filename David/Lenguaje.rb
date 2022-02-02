class Lenguaje
    attr_accessor :nombre
    attr_accessor :dinero
    attr_accessor :tiempo
    attr_accessor :encuesta
    def initialize(nombre,dinero,tiempo,encuesta)
        @nombre=nombre
        @dinero=dinero
        @tiempo=tiempo
        @encuesta=encuesta
    end
    def print
        puts "Nombre: #{@nombre} Dinero: #{@dinero} Tiempo: #{@tiempo} Encuestas: #{@encuesta}"
    end
end