# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsWorkers::GetExternalNewsWorker, type: :worker do
  it { is_expected.to be_processed_in :cron_task }
  it { is_expected.to be_retryable 3 }

  it 'enqueues worker with correct params' do
    described_class.perform_async
    expect(described_class).to have_enqueued_sidekiq_job
  end

  describe '.perform' do
    context 'when Finnhun API' do
      it 'should enqueue BulkInsert worker' do
        VCR.use_cassette('finnhub/get_general_news', match_requests_on: [:method]) do
          described_class.new.perform
          expect(NewsWorkers::BulkInsertNewsWorker.jobs.size).to eq 1
        end
      end
    end
  end
end
