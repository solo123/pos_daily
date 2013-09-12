class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.date :trade_date
      t.string :merchant_number
      t.string :merchant_name
      t.string :agent_number
      t.string :agent_name
      t.string :terminal_number
      t.integer :biz_count
      t.decimal :amount, precision: 2, scale: 10
      t.decimal :commission, precision: 2, scale: 10
      t.decimal :actual_amount, precision: 2, scale: 10
      t.decimal :base_commission, precision: 2, scale: 10
      t.decimal :profit, precision: 2, scale: 10

      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
