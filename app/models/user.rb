# frozen_string_literal: true
class User < ApplicationRecord
  validates :name, presence: true
  validates :state, presence: true
  #validates :status
  validates :organization_id, presence: true
  after_initialize { p 'initialize' }
  scope :user_state, lambda { |organization_id, state|
                       joins(:posts, :organization)
                         .where(organizations: organization_id, state: state)
                         .where('status = 0').distinct
                     }

  belongs_to :organization
  has_many :posts
  has_many :images, as: :imageable

end
