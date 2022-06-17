require 'tdd'

describe Array do 

    describe "#my_uniq" do
        it "removes all duplicates in an array" do 
            expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
        end

        it "should take an array as argument" do 
            expect([1,2,1,3,3].is_a?(Array)).to eq(true)
        end
    end

    describe "#two_sum" do 
        it "should take an array as argument" do 
            expect([-1,0,2,-2,1].is_a?(Array)).to eq(true)
        end

        it "should find all pairs of positions where elements sum to zero" do 
            expect([-1,0,2,-2,1].two_sum).to eq([[0,4], [2,3]])
        end
    end

    describe "#my_transpose" do 

        it "should swap rows and cols" do
            expect([[0, 1, 2],[3, 4, 5],[6, 7, 8]].my_transpose).to eq([[0,3,6],[1,4,7],[2,5,8]])
        end
    end

end