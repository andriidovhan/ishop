class CreatCartsProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts_products, id: false do |t|
      t.integer :cart_id
      t.integer :product_id
    end
  end
end
