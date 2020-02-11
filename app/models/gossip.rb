class Gossip < ApplicationRecord
  belongs_to :user
  has_many :gossip_x_tags
  has_many :tags, through: :gossip_x_tags
end
