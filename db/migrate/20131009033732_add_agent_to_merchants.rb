class AddAgentToMerchants < ActiveRecord::Migration
  def change
		add_column :merchants, :agent_id, :integer
		add_column :merchants, :client_id, :integer
		add_column :users, :agent_id, :integer
  end
end
