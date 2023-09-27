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

  it 'have 3 orders - create_list' do
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end

  it 'overwriting a factory attribute - create_list' do
    orders = create_list(:order, 3, description: "Overwriting")
    puts orders.inspect
    expect(orders.count).to eq(3)
  end

  it 'has_many' do
    customer = create(:customer, :with_orders)
    puts customer.inspect
    puts customer.orders.inspect
    expect(customer.orders.count).to eq(3)
  end
end
