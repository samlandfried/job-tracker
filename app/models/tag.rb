class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :jobs, through: :taggings

  validates :title, presence: true, uniqueness: true
end