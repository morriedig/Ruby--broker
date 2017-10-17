require 'rails_helper'

RSpec.describe SellCart, type: :model do
  describe "about sellcart function" do
    it "可以加入已存在的商品" do
      p1 = Product.create(title: 'ball', quantity: 10)
      sellcart = SellCart.new

      sellcart.add_sellitem(p1.id)

      expect(sellcart.empty?).to be false
    end
    it "加入的商品數量，都從一開始" do
      p1 = Product.create(title: 'ball', quantity: 10)
      p2 = Product.create(title: 'foot', quantity: 20)
      sellcart = SellCart.new

      sellcart.add_sellitem(p1.id)
      sellcart.add_sellitem(p2.id)

      expect(sellcart.sellitems.first.quantity).to be 1
      expect(sellcart.sellitems.last.quantity).to be 1

    end
    it "販賣車每增加一個商品，商品的數量就會減一" do
      p1 = Product.create(title: 'ball', quantity: 10)
      p2 = Product.create(title: 'foot', quantity: 20)
      sellcart = SellCart.new
      buyout = Buyout.new

      buyout.add_item(p1.id)
      buyout.add_item(p2.id)
      3.times{sellcart.add_sellitem(p1.id)}
      5.times{sellcart.add_sellitem(p2.id)}

      expect(sellcart.sellitems.first.quantity).to eq 3
      expect(sellcart.sellitems.last.quantity).to eq 5
      # expect(buyout.commodities.last.product.quantity).to eq 15

    end
    it "販賣車的數量，不可以超過商品數量，否則商品加入失敗" do
        p1 = Product.create(title: 'ball', quantity: 10)
        p2 = Product.create(title: 'foot', quantity: 20)
        sellcart = SellCart.new

        15.times{sellcart.add_sellitem(p1.id)}
        15.times{sellcart.add_sellitem(p2.id)}

        expect(sellcart.sellitems.first.quantity).to eq 10
        expect(sellcart.sellitems.last.quantity).to eq 15
    end
    it "加入販賣車的商品，可以再取消加入" do
      p1 = Product.create(title: 'ball', quantity: 10)
      p2 = Product.create(title: 'foot', quantity: 20)
      sellcart = SellCart.new

      5.times{sellcart.add_sellitem(p1.id)}
      3.times{sellcart.dec_sellitem(p1.id)}

      expect(sellcart.sellitems.first.quantity).to be 2
    end
    it "取消加入商品後，商品增加的數量會等於販賣車商品取消的數量" do
      
    end
    it "販賣車會自動計算價格"do
      
    end
    it "可以寄信給買家"
    it "可以查看之前的訊息紀錄"
    it "可以觀看買家平價"
    it "可以被評價"
    it "可以查看自己的交易紀錄"
  end
end
