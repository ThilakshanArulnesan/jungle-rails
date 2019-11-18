require 'rails_helper'
# t.string :name
#       t.text :description
#       t.string :image
#       t.integer :price_cents
#       t.integer :quantity

#       t.timestamps null: false
RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject{
      cat =  Category.create(name: "myNewCategory")
      product1 = described_class.new(name: "My cool product", description: "Cool product", image: "1.png", price_cents: 100, quantity: 2, category: cat)
    }
    # validation tests/examples here
    it 'is valid if everything provided' do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end



  end
end
