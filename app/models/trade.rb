class Trade < ActiveRecord::Base
  default_scope { order('id desc') }
  scope :new_import, -> { where(status: 0) }
  scope :published, -> { where(status: 1) }
end
