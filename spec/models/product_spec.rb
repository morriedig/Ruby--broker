require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "about product rspec" do
    it  "可以修改商品的資料" do

        p1 = Product.create(title: 'baseball', description: 'a ball', quantity: 5, file_location: 'no file', price: 50, transation_way: '7-11', transation_place: 'Taipei' )
        buyout = Buyout.new
        2.times{buyout.add_item(p1.id)}
        p1.update(title: 'basketball', description: 'a big ball', quantity: 3, file_location: 'no file', price: 150, transation_way: '7-11', transation_place: 'Taipei' )

        # why id first.product.title??  not first.title??
        expect(buyout.commodities.first.product.title).to eq p1.title
        expect(buyout.commodities.first.product.quantity).to eq p1.quantity
    end
  end
end
