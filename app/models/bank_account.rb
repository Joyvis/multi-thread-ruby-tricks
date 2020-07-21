# frozen_string_literal: true

class BankAccount < ApplicationRecord
  has_many :incoming_transfers, class_name: 'Transfer', foreign_key: :target_account_id
  has_many :outgoing_transfers, class_name: 'Transfer', foreign_key: :source_account_id
  belongs_to :user
end
