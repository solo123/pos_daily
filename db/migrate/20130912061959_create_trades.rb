class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.date :trade_date
      t.string :merchant_number
      t.string :agent_number
      t.string :terminal_number
      t.integer :biz_count
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :commission, precision: 10, scale: 2
      t.decimal :actual_amount, precision: 10, scale: 2
      t.decimal :base_commission, precision: 10, scale: 2
      t.decimal :profit, precision: 10, scale: 2

      t.timestamps
    end
  end
end
