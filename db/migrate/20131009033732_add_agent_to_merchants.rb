class AddAgentToMerchants < ActiveRecord::Migration
  def change
		change_table :merchants do |t|
			t.rename :user_id, :agent_id
			t.integer :client_id
		end
		change_table :users do |t|
			t.integer :agent_id
		end
  end
end
