require 'hand'
require 'deck'

describe Hand do
    let(:deck) {Deck.new}
    subject(:hand) {Hand.new(deck)}

    describe '#initialize' do 
        it 'should instantiate an array of 5 randomly chosen cards from a deck' do 
            expect(hand.cards.length).to eq(5)
        end
    end

    describe '#flush' do 
        it 'should check to see if every card has the same suit' do 
            expect()
        end
    end
end