# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsWorkers::GetExternalNewsWorker, type: :worker do
  subject(:worker) { NewsWorkers::GetExternalNewsWorker }
  let(:worker_instance) { worker.new }

  it { is_expected.to be_processed_in :reading }
  it { is_expected.to be_retryable 3 }

  it 'enqueues worker with correct params' do
    worker.perform_async
    expect(worker).to have_enqueued_sidekiq_job
  end

  describe '.perform' do
    context 'when contact exists' do
      context 'save contact' do
        it 'updates the full_name attribute with user.full_name' do
          worker_instance.perform
          NewsWorkers::SaveExternalNewsWorker.drain
          expect(News.count).to eq 400
        end
      end

      context 'fails to update the contact' do
        before do
          # allow(worker_instance)
          #   .to receive(:update_contact).and_return(Error(Mongoid::Errors::Validations.new(contact)))
        end

        it 'raise error' do
          # expect {
          #   worker_instance.perform(contact.identity)
          # }.to raise_error(Mongoid::Errors::Validations)
        end
      end
    end

    context 'when contact does not exists' do
      it 'does not calls update_contact method' do
        expect(worker_instance).not_to receive(:update_contact)
        worker_instance.perform('fake_contact_id')
      end
    end
  end
end
