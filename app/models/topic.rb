class Topic < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :users, through: :follow_topics
end
