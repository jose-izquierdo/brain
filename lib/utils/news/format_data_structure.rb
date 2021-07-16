# frozen_string_literal: true

module Utils
  module News
    class FormatDataStructure
      def initialize(item)
        @item = item
      end

      def formatted_news_item
        {
          category: category,
          headline: headline,
          image: image,
          related: related,
          source: source,
          url: url,
          publish_date: publish_date,
          external_id: external_id,
          summary: summary,
          created_at: set_current_time,
          updated_at: set_current_time
        }
      end

      private

      attr_reader :item

      def category
        item.category
      end

      def headline
        item.headline
      end

      def image
        item.image
      end

      def related
        item.related
      end

      def source
        item.source
      end

      def url
        item.url
      end

      def publish_date
        Time.at(item.datetime)
      end

      def external_id
        item.id
      end

      def summary
        item.summary
      end

      def set_current_time
        Time.now
      end
    end
  end
end
