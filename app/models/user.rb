class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  validates :first_name, :last_name,
    presence: true
  has_secure_password
  validates :email,
    presence: true
  validates :password, 
    presence: true, 
    confirmation: true, 
    length: { minimum: 6 }
end
