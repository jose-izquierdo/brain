# frozen_string_literal: true

module Integrations
  module Finnhub
    class Api
      def initialize
        configure_api
      end

      def configure_api
        FinnhubRuby.configure { |config| config.api_key['token'] = ENV['FINNHUB'] }
      end

      def initialize_api
        FinnhubRuby::DefaultApi.new
      end
    end
  end
end
