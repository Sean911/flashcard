class Word < ActiveRecord::Base
  belongs_to :list
  belongs_to :user
  has_many :answers
end
