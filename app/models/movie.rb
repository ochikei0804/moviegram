class Movie < ApplicationRecord
  belongs_to :user
  attachment :image # ここを追加（_idは含めない）
  has_many :favorites, dependent: :destroy
  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
end
