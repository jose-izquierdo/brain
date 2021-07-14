# frozen_string_literal: true

module NewsWorkers
  class GetExternalNewsWorker < BaseWorker
    sidekiq_options queue: :reading, retry: 3

    attr_reader :data, :formatted_data

    def perform
      @data = []
      @formatted_data = []

      api_finnhub = Integrations::Finnhub::Api.new.initialize_api
      News::TYPES.each do |type|
        data.concat(api_finnhub.general_news(type))
      end

      format_data
      insert_data
    end

    private

    def format_data
      data.each do |d|
        formatted_data.push(
          {
            category: d.category,
            headline: d.headline,
            image: d.image,
            related: d.related,
            source: d.source,
            url: d.url,
            publish_date: Time.at(d.datetime),
            external_id: d.id,
            summary: d.summary,
            created_at: Time.now,
            updated_at: Time.now
          }
        )
      end
    end

    def insert_data
      NewsWorkers::SaveExternalNewsWorker.perform_async(formatted_data)
    end
  end
end
