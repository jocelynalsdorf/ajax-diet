class Food < ActiveRecord::Base
  belongs_to :user

  validates :type, :presence => true
  validates :calories, :presence => true
end
