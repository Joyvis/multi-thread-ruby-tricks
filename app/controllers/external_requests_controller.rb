class ExternalRequestsController < ApplicationController
  def index
    sleep(0.5)
    render json: response_body
  end

  private

  def response_body
    10.times.map do
      response_body_item
    end
  end

  def response_body_item
    { desc: :transaction, value: 1 }
  end
end
