# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsWorkers::BulkInsertNewsWorker, type: :worker do
  it { is_expected.to be_processed_in :writing }
  it { is_expected.to be_retryable 3 }

  describe '.perform' do
    let(:worker) { described_class }
    let(:worker_instance) { worker.new }

    context 'when data is correct and match all the criteria to be saved' do
      let(:default_attributes) { { created_at: Time.now.round, updated_at: Time.now.round } }
      let(:data) { [] }

      before do
        10.times do
          data.push(default_attributes.merge(attributes_for(:news)))
        end
      end

      it 'enqueues worker with correct params' do
        worker.perform_async(data)
        expect(described_class).to have_enqueued_sidekiq_job(data)
      end

      it 'save all news' do
        worker_instance.perform(data)
        expect(News.count).to match 10
      end
    end
  end
end
