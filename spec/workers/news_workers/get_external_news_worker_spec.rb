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
      let(:bulk_news_worker) { NewsWorkers::BulkInsertNewsWorker }

      before do
        VCR.use_cassette('finnhub/get_general_news', match_requests_on: [:method]) do
          described_class.new.perform
        end
      end

      it 'should enqueue bulk insert worker correctly' do
        expect(bulk_news_worker.jobs.size).to eq 1
      end

      it 'executes bulk insert worker and saves all news correctly' do
        expect(News.count).to be_zero

        bulk_news_worker.drain
        expect(News.count).to_not be_zero
      end
    end
  end
end
