class Post < ApplicationRecord
  validates :comment, length: {maximum: 3}
end
