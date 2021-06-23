# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'validates status' do
    should validate_presence_of :status
  end

  it 'validates user_id' do
    should validate_presence_of :user_id
  end

  it 'validates organization_id' do
    should validate_presence_of :organization_id
  end

  it 'has many' do
    should have_many :images
  end

  it 'belongs to' do
    should belong_to :user
    should belong_to :organization
  end
end
