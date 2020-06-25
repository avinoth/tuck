class Template < ApplicationRecord
  validates :name, :app, :content, presence: true

  belongs_to :app
end
