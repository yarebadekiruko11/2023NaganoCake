class CreateOrderBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :order_boxes do |t|
      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :claim, null: false
      t.integer :postage, null: false
      t.integer :payment_method, default: 0, null: false, limit: 1

      #チャレンジ 注文ステータス
      #t.integer :status, default: 0, null: false, limit: 1


      t.timestamps
    end
  end
end
