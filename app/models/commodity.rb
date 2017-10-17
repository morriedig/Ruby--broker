class Commodity
  attr_reader :product_id, :product_quantity

  def initialize(product_id, quantity=1)
    @product_id = product_id
    @product_quantity = quantity
  end

  def increment(n=1)
    @product_quantity += n
  end

  def decrement(n=1)
    @product_quantity -= n
  end

  def product
    Product.find_by(id:product_id)
  end

  def update
    @product = Product.find_by(id:product_id)
    @product.update_attributes(product_params)
  end

  private
  #what is the function??? the function is like "product"??
  def product_params
    params.require(:product).permit(:title, :description, :quantity, :file_location, :price, :transation_way, :transtion_place )
  end

end