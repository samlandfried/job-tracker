class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :category
  has_many :comments

  validates :title, :level_of_interest, :city, presence: true
end
