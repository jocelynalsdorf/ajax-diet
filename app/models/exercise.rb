class Exercise < ActiveRecord::Base
  belongs_to :user

  validates :description, :presence => true
  validates :burned, :presence => true
end
