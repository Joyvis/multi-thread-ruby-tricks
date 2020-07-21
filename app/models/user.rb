# frozen_string_literal: true

class User < ApplicationRecord
  has_many :bank_accounts
end
