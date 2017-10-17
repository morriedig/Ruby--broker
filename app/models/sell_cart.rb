class SellCart
  attr_reader :sellitems

  #may i merge the SellCart and Sellitem method??
  #how can i modify the initialize???
  def initialize
    @sellitems = []
  end

  def add_sellitem(item_id)
    found_item = @sellitems.find{|i| i.sellitem_id == item_id }
    #is there not @commodities???
    # find_commodity = @commodities.find{ |commodity| commodity.product_id == item_id }

    # if found_item.quantity >= product_quantity
    #   return
    # end

    if found_item
      found_item.increase
      # find_commodity.decrement
    else
      @sellitems << Sellitem.new(item_id)
    end
  end

  def dec_sellitem(item_id)
    found_item = @sellitems.find{|i| i.sellitem_id == item_id }

    found_item.decrease

  end



  def empty?
    @sellitems.nil?
  end

end