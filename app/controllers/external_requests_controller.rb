class ExternalRequestsController < ApplicationController
  def index
    sleep(1)
    render json: transactions
  end

  private

  def transactions
    10.times.map do
      transaction
    end
  end

  def transaction
    { desc: :transaction, value: 1 }
  end
end
