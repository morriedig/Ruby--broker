class Buyout
  attr_reader :commodities

  def initialize
    @commodities = []
  end

  def add_item(product_id)
    find_commodity = @commodities.find{ |commodity| commodity.product_id == product_id }

    if find_commodity
      find_commodity.increment
    else
      @commodities << Commodity.new(product_id)
    end
  end

  def subtract_item(product_id)
    find_commodity = @commodities.find{ |commodity| commodity.product_id == product_id }

    if find_commodity.product_quantity > 0
      find_commodity.decrement
    end
  end

  def take_off(product_id)
    find_commodity = @commodities.find{ |commodity| commodity.product_id == product_id }
    @commodities.delete(find_commodity)
    # @commodities.delete(product_id)
  end

  def empty?
    @commodities.nil?
  end

end