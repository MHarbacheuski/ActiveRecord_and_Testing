class Post < ApplicationRecord
  validates :status, presence: true
  # validates :organization_id, presence: true
  # validates :user_id, presence: true
  after_initialize { p 'initialize' }
  before_destroy { p 'delete' }

  belongs_to :user
  belongs_to :organization

  has_many :images, as: :imageable

end

