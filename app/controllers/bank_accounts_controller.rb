# frozen_string_literal: true

class BankAccountsController < ApplicationController
  def show
    BankAccounts::CalculateBalance::Flow
      .call(bank_account: bank_account)
      .on_success { |result| render json: result }
  end

  private

  def bank_account
    BankAccount.find(params[:id])
  end
end
