# frozen_string_literal: true

module Utils
  module News
    class FormatDataStructure
      def initialize(item)
        @default_attributes = {
          created_at: Time.now,
          updated_at: Time.now,
          publish_date: Time.at(item[:datetime])
        }
        @item = item.except(:datetime)
      end

      attr_reader :item, :default_attributes

      def formatted_news_item
        default_attributes.merge(set_main_attributes)
      end

      private

      def set_main_attributes
        attributes = {}
        item.each { |key, value| attributes[key] = value }

        attributes
      end
    end
  end
end
