class User < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true
  validates :organization_id, presence: true
  validates_associated :posts
  after_initialize { p 'initialize' }

  belongs_to :organization
  has_many :posts, dependent: :destroy

end
