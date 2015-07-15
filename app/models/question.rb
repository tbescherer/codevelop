class Question < ActiveRecord::Base
  validates :body, presence: true
  has_many :answers
end
