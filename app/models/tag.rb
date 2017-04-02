class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :jobs, through: :taggings

  validates :title, presence: true, uniqueness: true
end