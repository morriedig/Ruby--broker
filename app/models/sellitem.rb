class Sellitem #< Commodity
  # include ActiveModel::Commodity
  # class Customer < ActiveRecord::Base
  # has_many :orders, dependent: :destroy
  # end

  attr_reader :sellitem_id,:quantity

  def initialize(sellitem_id, quantity = 1)
    @sellitem_id = sellitem_id
    @quantity = quantity
    #i try to add the Product but false
    # @product = Product.find(id:product_id)
  end

  def increase(n=1)
    # product_quantity = Product.product_quantity
    # if @quantity >= product_quantity
    #   return
    # else
      @quantity += n
    # end
  end

  def decrease(n=1)

    @quantity -= n

  end

end