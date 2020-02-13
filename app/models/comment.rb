class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  validates :content, 
    presence: true,
    allow_blank: false
end
