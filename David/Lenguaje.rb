class Lenguaje
    attr_accessor :nombre
    attr_accessor :dinero
    attr_accessor :tiempo
    def initialize(nombre,dinero,tiempo)
        @nombre=nombre
        @dinero=dinero
        @tiempo=tiempo
    end
    def print
        puts "Nombre: #{@nombre} Dinero: #{@dinero} Tiempo #{@tiempo}"
    end
end