require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it 'response successfully' do
    get :index
    expect(response).to be_successful
  end
end
