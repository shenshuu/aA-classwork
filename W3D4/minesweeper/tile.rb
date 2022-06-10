class Tile 
    attr_accessor :value, :bomb, :reveal, :flag

    def initialize(value = 0)
        @reveal = false 
        @flag = false 
        @value = value
        @bomb = false
    end

    def create_bomb 
        @bomb = true 
        @value = "B"
    end 

end 