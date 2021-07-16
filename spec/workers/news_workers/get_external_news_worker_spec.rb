# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsWorkers::GetExternalNewsWorker, type: :worker do
  it { is_expected.to be_processed_in :reading }
  it { is_expected.to be_retryable 3 }

  it 'enqueues worker with correct params' do
    described_class.perform_async
    expect(described_class).to have_enqueued_sidekiq_job
  end

  # describe '.perform' do
  #   context 'when Finnhun API' do
  #     before do
  #       described_class.new.perform
  #     end
  #
  #     it 'should perform in the right queue' do
  #       assert_equal :reading, described_class.queue
  #     end
  #
  #     it 'should enqueue BulkInsert worker' do
  #       expect(NewsWorkers::BulkInsertNewsWorker.jobs.size).to eq 1
  #     end
  #   end
  # end
end
