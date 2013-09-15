class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :merchant_number
      t.string :merchant_name
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
