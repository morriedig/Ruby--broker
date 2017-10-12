class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.string :file_location
      t.integer :price
      t.string :transation_way
      t.string :transation_place
      
      t.timestamps
    end
  end
end
