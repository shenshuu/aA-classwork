class Player
    
    attr_reader :hand, :pot 
    def initialize(hand, pot)
        @hand = hand
        @pot = pot
    end

    def discard(idx) 
        @hand.delete_at(idx)
    end

    def see 
        true 
    end

    def raise(amount) 
        raise 'Not enough cash, stranger' if amount > self.pot 
        @pot -= amount 
    end

    def fold
        true 
    end
end