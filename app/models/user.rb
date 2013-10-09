class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :merchants
	has_many :clients, :foreign_key => 'agent_id', :class_name => 'User'
	belongs_to :agent, :class_name => 'User'

	def admin?
		self.roles && self.roles.index('admin')
	end
end
