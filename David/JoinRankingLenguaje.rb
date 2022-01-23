class JoinRankingLenguaje
    attr_accessor :nombre
    attr_accessor :rankin
    attr_accessor :dinero
    attr_accessor :tiempo
    def initialize(nombre,rankin,dinero,tiempo)
        @nombre=nombre
        @rankin=rankin
        @dinero=dinero
        @tiempo=tiempo
    end
    def print
        puts "Nombre: #{@nombre} Ranking: #{@rankin} Dinero: #{@dinero} Tiempo #{@tiempo}"
    end
end