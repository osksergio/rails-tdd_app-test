require 'rails_helper'

RSpec.describe Customer, type: :model do

  it 'create a customer' do
    customer = create(:customer)
    expect(customer.full_name).to eq('Sr. Sergio Oseko')
  end
end
