require 'rails_helper'

RSpec.describe Buyout, type: :model do
  describe "broker的基本功能" do
    it  "把需要收購的商品放入商店中，商店就有商品了" do
      buyout = Buyout.new
      buyout.add_item(1)

      expect(buyout.empty?).to be false      
    end
    it  "增加相同的商品，商品的數量會增加，數目不會，也可以減少商品數量" do
      #why don't generate a database??
      #here, we use "increment method" in Buyout's class. and the method is wrotten in Commodity's class. so Why cna't use??
      buyout = Buyout.new
      4.times{buyout.add_item(2)}
      3.times{buyout.add_item(1)}
      2.times{ buyout.subtract_item(1)}

      expect(buyout.commodities.length).to be 2
      expect(buyout.commodities.first.quantity).to be 4
      expect(buyout.commodities.last.quantity).to be 1
    end
    it  "上架商品後，可以被刪除" do
      buyout = Buyout.new
      buyout.add_item(1)
      buyout.add_item(3)
      buyout.add_item(2)
      buyout.take_off(1)

      expect(buyout.commodities.length).to eq 2
    end
    it  "可以修改商品的資料"
    it  "可以查看賣家的基本資料"
    it  "可以跟傳送訊息給賣家"
    it  "可以查看傳送的訊息"
    it  "可以取消此次交易"
    it  "可以對賣家進行評價"
    it  "可以查看自己的交易紀錄"
  end
end
