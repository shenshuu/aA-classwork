require_relative './player.rb'
require_relative './hand.rb'

class Game 

    RANKINGS = [:straight_flush, :four_kind, :full_house, :flush,
        :straight, :three_kind, :two_pair, :one_pair, :high_card]

    def initialize(player1, player2, deck)
        @deck = Deck.new 
        @player1 = Player.new(Hand.new(@deck, 100))
        @player2 = Player.new(Hand.new(@deck, 100))
        @current_player = @player1
        @total_take = 0
    end

    def switch_turn 
        @current_player = @current_player == @player1 ? @player2 : @player1
    end

    def pot_amount 
        @total_take
    end

    def play 
        #FINISH GAME LOOP 
    end
end
