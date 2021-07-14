# frozen_string_literal: true

class News < ApplicationRecord
  # constants
  TYPES = %w[general forex crypto merger].freeze

  # validations
  validates :external_id, uniqueness: true, presence: true
end
