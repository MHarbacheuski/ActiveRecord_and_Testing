# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates name' do
    should validate_presence_of :name
  end

  it 'validates state' do
    should validate_presence_of :state
  end

  it 'validates organization_id' do
    should validate_presence_of :organization_id
  end

  it 'has many' do
    should have_many :images
    should have_many :posts
  end

  it 'belongs to' do
    should belong_to :organization
  end
end