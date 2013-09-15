class Merchant < ActiveRecord::Base
  belongs_to :user
  
  scope :free_merchants, -> { where(user_id: nil) } 
end
