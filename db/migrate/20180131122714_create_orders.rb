class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :user_name
      t.string :phone
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
