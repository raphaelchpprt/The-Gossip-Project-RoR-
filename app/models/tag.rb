class Tag < ApplicationRecord
  has_many :gossip_x_tags
  has_many :gossips, through: :gossip_x_tags
end
