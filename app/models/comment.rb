class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie, optional: true
end
