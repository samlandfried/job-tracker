class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :comments, dependent: :destroy

  validates :title, :level_of_interest, :city, presence: true
end
