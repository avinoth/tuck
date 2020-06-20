class App < ApplicationRecord
  validates :name, :smtp_key, :smtp_secret, :smtp_address, :smtp_port, :smtp_authentication, presence: true
end
