require 'set'
require_relative './deck.rb'

class Hand 

    attr_reader :cards, :combo 

    VALUES = [2,3,4,5,6,7,8,9,10,:Jack,:Queen,:King,:Ace] 

    def initialize(deck)
        @cards = []
        @combo = nil
        deck.shuffle!
        (1..5).each {|i| @cards << deck.draw}
        get_combo 
    end

    def flush 
        suit = @cards.map {|card| card.suit}
        Set.new(suit).length == 1
    end

    def straight
        indices = @cards.map {|card| VALUES.index(card.value)}
        indices.sort! 
        (0...indices.length-1).each {|i| return false if indices[i]+1 != indices[i+1]}
        true 
    end

    def straight_flush
        flush && straight 
    end

    def full_house 
        value = @cards.map {|card| card.value}
        suit = @cards.map {|card| card.suit}
        Set.new(value).length == 2 && Set.new(suit).length >= 3
    end

    def one_pair 
        value = @cards.map {|card| card.value}
        Set.new(value).length == 4
    end

    def two_pairs 
        value = @cards.map {|card| card.value}
        suit = @cards.map {|card| card.suit}
        Set.new(value).length == 3 && Set.new(suit).length >= 2
    end

    def four_kind 
        value = @cards.map {|card| card.value}
        suit = @cards.map {|card| card.suit}
        Set.new(value).length == 2 && Set.new(suit).length == 4
    end

    def three_kind 
        value = @cards.map {|card| card.value}
        suit = @cards.map {|card| card.suit}
        !self.two_pairs && (Set.new(value).length == 3 && Set.new(suit).length >= 3)
    end

    def get_combo
         
        if flush && straight 
            @combo = :straight_flush
        elsif four_kind
            @combo = :four_kind 
        elsif full_house
            @combo = :full_house
        elsif flush 
            @combo = :flush
        elsif straight
            @combo = :straight 
        elsif three_kind
            @combo = :three_kind
        elsif two_pairs 
            @combo = :two_pair
        elsif one_pair
            @combo = :one_pair
        else
            @combo = :high_card
        end
    end

end
