require 'deck'

describe Deck do
    subject(:deck) {Deck.new} 
    describe '#initialize' do 
        it 'should initialize a deck with 52 cards' do 
            expect(deck.cards.length).to eq(52)
            expect(deck.cards.all? {|card| card.instance_of?(Card)}).to eq(true)
        end
    end

    describe '#shuffle!' do 
        it 'should shuffle and mutate the deck' do 
            cards = deck.cards
            cards.shuffle! 
            expect(deck.cards).not_to eq(cards)
        end
    end

    describe 'draw' do 
        it 'should remove one card from top the deck' do 
            removed_card = deck.cards[-1]
            card = deck.draw 
            expect(card.value).to eq(removed_card.value)
            expect(card.suit).to eq(removed_card.suit)
        end
    end

end