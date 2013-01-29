class Category < ActiveRecord::Base
  attr_accessible :max_value, :min_value, :name

  validates :max_value, :min_value, :name, presence: true
  validates :name, uniqueness: true
end
