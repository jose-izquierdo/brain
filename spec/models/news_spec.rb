# frozen_string_literal: true

require 'rails_helper'

RSpec.describe News, type: :model do
  describe 'Validations' do
    it { should validate_uniqueness_of(:external_id) }
    it { should validate_presence_of(:external_id) }
  end
end
