class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :user, index: true
      t.text :address
      t.integer :status
      t.text :comment

      t.timestamps null: false
    end
    add_foreign_key :orders, :carts
    add_foreign_key :orders, :users
  end
end
