class Template < ApplicationRecord
  has_ancestry

  validates :name, :app, :content, presence: true

  belongs_to :app
end
