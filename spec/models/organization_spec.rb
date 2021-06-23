# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Organization, type: :model do
  it 'validates name' do
    should validate_presence_of :name
  end

  it 'has many' do
    should have_many :users
    should have_many :posts
  end
end