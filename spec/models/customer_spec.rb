require 'rails_helper'

RSpec.describe Customer, type: :model do

  it '# create a customer' do
    customer = create(:customer)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it '# create a customer (usando um apelido para a factory)' do
    customer = create(:user)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it '# create a customer (sobrescrevendo um atributo da factory)' do
    customer = create(:customer, name: 'Sergio Oseko')
    expect(customer.full_name).to eq('Sr. Sergio Oseko')
  end

  it '# usando a herança das factories' do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)
  end

  it '# mais um exemplo de herança das factories' do
    customer = create(:customer_default)
    expect(customer.vip).to eq(false)
  end

  it '# usando o attributes_for' do
    attrs = attributes_for(:customer)
    attrs1 = attributes_for(:customer_vip)
    attrs2 = attributes_for(:customer_default)
    puts attrs
    puts attrs1
    puts attrs2
  end

  it 'exemplo usando o attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to  start_with("Sr.")
  end

  it { expect{ create(:customer) }.to change{ Customer.all.size }.by(1) }
end
