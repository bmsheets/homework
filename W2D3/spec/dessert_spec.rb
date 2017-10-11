require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
    subject(:brownie) { Dessert.new("brownie", 10, chef) }
    let(:chef) { double("chef", name: "brandt") }

  describe "#initialize" do
    it "sets a type" do
        expect do
            brownie.type.to eq("brownie")
        end
    end

    it "sets a quantity" do
        expect do
            brownie.quantity.to eq(10)
        end
    end

    it "starts ingredients as an empty array" do
        expect do
            brownie.ingredients.to eq([])
        end
    end

    it "raises an argument error when given a non-integer quantity" do
        expect do
            Dessert.new("brownie", "not an integer", "name").to raise_error
        end
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
        expect do
            brownie.ingredients.length.to be > 0
            brownie.add_ingredient("sugar")
        end
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
        ingredients = []
        10.times do |i|
            ingredients << i
            brownie.add_ingredient(i)
        end
        expect(brownie.ingredients).to eq ingredients
        brownie.mix!
        expect(brownie.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
        brownie.eat(1)
        expect(brownie.quantity).to eq(9)
    end

    it "raises an error if the amount is greater than the quantity" do
        expect { brownie.eat(11) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
        allow(chef).to receive(:titleize).and_return("Chef brandt the Great Baker")
        expect(brownie.serve).to eq("Chef brandt the Great Baker has made 10 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
        expect(chef).to receive(:bake).with(brownie)
        brownie.make_more
    end
  end
end
