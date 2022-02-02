class JoinRankingLenguaje
    attr_accessor :nombre
    attr_accessor :rankin
    attr_accessor :dinero
    attr_accessor :tiempo
    attr_accessor :encuesta
    def initialize(nombre,rankin,dinero,tiempo,encuesta)
        @nombre=nombre
        @rankin=rankin
        @dinero=dinero
        @tiempo=tiempo
        @encuesta=encuesta
    end
    def print
        puts "Nombre: #{@nombre} Ranking: #{@rankin} Dinero: #{@dinero} Tiempo #{@tiempo} Encuesta: #{@encuesta}"
    end
end