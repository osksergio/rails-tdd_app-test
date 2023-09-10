require 'rails_helper'

RSpec.describe Customer, type: :model do

  it 'create a customer' do
    customer = create(:customer)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it 'create a customer (usando um apelido para a factory)' do
    customer = create(:user)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it 'create a customer (sobrescrevendo um atributo da factory)' do
    customer = create(:customer, name: 'Sergio Oseko')
    expect(customer.full_name).to eq('Sr. Sergio Oseko')
  end

  it { expect{ create(:customer) }.to change{ Customer.all.size }.by(1) }
end
