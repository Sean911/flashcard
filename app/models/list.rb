class List < ActiveRecord::Base
  belongs_to :user
  has_many :words

  validates :name, presence: true
end
