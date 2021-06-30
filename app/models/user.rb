# frozen_string_literal: true
class User < ApplicationRecord
  validates :name, presence: true
  validates :state, presence: true
  #validates :status
  validates :organization_id, presence: true
  after_initialize { p 'initialize' }

  belongs_to :organization
  has_many :posts
  has_many :images, as: :imageable

end
