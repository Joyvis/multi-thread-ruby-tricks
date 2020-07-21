# frozen_string_literal: true

class Transfer < ApplicationRecord
  belongs_to :source_account, class_name: 'BankAccount'
  belongs_to :target_account, class_name: 'BankAccount'
end
