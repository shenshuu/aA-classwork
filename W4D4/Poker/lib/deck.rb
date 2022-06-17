require_relative './card.rb'

class Deck 

    attr_reader :cards 

    def initialize
        suits = [:Diamonds,:Clubs,:Hearts,:Spades] 
        values = [:Ace,2,3,4,5,6,7,8,9,10,:Jack,:Queen,:King] 
        
        @cards = []
        for i in 0...suits.length do 
            for j in 0...values.length do 
                @cards << Card.new(values[j], suits[i])
            end
        end
    end

    def shuffle!
        @cards.shuffle!
    end

    def draw 
        @cards.pop 
    end

end

p Deck.new 