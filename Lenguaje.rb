class Lenguaje
    @nombre
    @dinero
    @tiempo
    def initialize(nombre,dinero,tiempo)
        @nombre=nombre
        @dinero=dinero
        @tiempo=tiempo
    end
    def print
        puts "Nombre: #{@nombre} Dinero: #{@dinero} Tiempo #{@tiempo}"
    end
end