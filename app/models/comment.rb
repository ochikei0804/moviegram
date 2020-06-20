class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie, optional: true
  
  validates :content, length: { maximum:3000 }
end
