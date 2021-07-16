# frozen_string_literal: true

module NewsWorkers
  class GetExternalNewsWorker < BaseWorker
    sidekiq_options queue: :reading, retry: 3

    attr_reader :all_items, :formatted_items

    def perform
      @all_items = []
      @formatted_items = []

      api_finnhub = Integrations::Finnhub::Api.new.initialize_api
      News::TYPES.each { |type| all_items.concat(api_finnhub.general_news(type)) }

      set_items_format
      exec_bulk_insert
    end

    private

    def set_items_format
      all_items.each { |item| formatted_items.push(Utils::News::FormatDataStructure.new(item).formatted_news_item) }
    end

    def exec_bulk_insert
      NewsWorkers::BulkInsertNewsWorker.perform_async(formatted_items)
    end
  end
end
