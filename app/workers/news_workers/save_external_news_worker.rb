# frozen_string_literal: true

module NewsWorkers
  class SaveExternalNewsWorker < BaseWorker
    sidekiq_options queue: :writing, retry: 3

    def perform(data)
      News.insert_all(data, returning: %w[id external_id category])
    end
  end
end
