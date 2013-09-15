class CreateTtts < ActiveRecord::Migration
  def change
    create_table :ttts do |t|
      t.string :name
      t.integer :level

      t.timestamps
    end
  end
end
