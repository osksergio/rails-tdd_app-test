require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it 'response successfully' do
    get :index
    expect(response).to be_successful
  end

  it 'responds a 200 response' do
    get :index
    expect(response).to have_http_status(200)
  end
end
