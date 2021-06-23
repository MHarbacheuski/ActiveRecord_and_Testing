# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Image, type: :model do
  it 'belongs to' do
    should belong_to :imageable
  end
end