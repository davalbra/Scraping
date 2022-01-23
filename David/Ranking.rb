class Ranking
    attr_accessor :nombre
    attr_accessor :rankin
    def initialize(nombre,rankin)
        @nombre=nombre
        @rankin=rankin
    end
    def print
        puts "Nombre: #{@nombre} ranking: #{@rankin} "
    end
end