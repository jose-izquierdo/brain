# frozen_string_literal: true

class BaseWorker
  include Sidekiq::Worker

  def self.default_perform_method
    :perform_async
  end

  def perform(event)
    puts "\n\n Doing hard work with #{event['event']}. Received data: #{event['params'].inspect}\n\n\n"
  end
end
