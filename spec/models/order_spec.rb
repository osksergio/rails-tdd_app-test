require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'have one order' do
    order = create(:order)
    puts order.description
    puts order.customer
    puts order.customer.name
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'have another order' do
    customer = create(:customer)
    order = create(:order, customer: customer)
    expect(order.customer).to be_kind_of(Customer)
  end
end
