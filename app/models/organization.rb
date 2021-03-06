class Organization < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates_associated :users
  after_initialize { p 'initialize' }
  after_find { p 'find' }

  has_many :users, dependent: :destroy
  has_many :posts, through: :users, dependent: :destroy

end
