class Post < ApplicationRecord
  validates :status, presence: true
  # validates :organization_id, presence: true
  # validates :user_id, presence: true
  after_initialize { p 'initialize' }
  before_destroy { p 'delete' }
  scope :post_to_organization, ->(organization_id) { joins(:organization).where(organization_id: organization_id) }

  belongs_to :user
  belongs_to :organization

  has_many :images, as: :imageable

end

