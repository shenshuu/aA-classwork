require 'card'

describe Card do
    subject(:card) { Card.new(:King, :Spades) } 

    it "instantiates a card with an initial value and suit" do 
        expect(card.value).to eq(:King)
        expect(card.suit).to eq(:Spades)
    end

    it 'must have a valid suit' do
        suits = [:Diamonds,:Clubs,:Hearts,:Spades] 
        expect(suits.include?(card.suit)).to eq(true)
    end

    it 'must have a valid value' do
        values = [:Ace,1,2,3,4,5,6,7,8,9,10,:Jack,:Queen,:King] 
        expect(values.include?(card.value)).to eq(true)
    end
end