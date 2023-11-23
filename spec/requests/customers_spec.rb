require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "works! 200 OK" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it "JSON 200 OK" do
      get "/customers.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json([
        id: 1,
        name: "Teste da Silva",
        email: "teste@silva.com"
      ])
    end

    it "show - JSON 200 OK" do
      get "/customers/1.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(id: 1)
    end

    it "show - JSON (Rspec puro + JSON)" do
      get "/customers/1.json"
      response_body = JSON.parse(response.body)
      expect(response_body.fetch("id")).to eq(1)
      expect(response_body.fetch("name")).to be_kind_of(String)
      expect(response_body.fetch("email")).to be_kind_of(String)
    end

    it "uses be_kind_of in the include_json" do
      get "/customers.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json([
        id: /\d/,
        name: (be_a_kind_of String),
        email: (be_a_kind_of String)
      ])
    end

    it "uses be_kind_of in the include_json (id = 1)" do
      get "/customers/1.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(
        id: /\d/,  # expressão regular indicando um número
        name: (be_a_kind_of String),
        email: (be_a_kind_of String)
      )
    end

    it 'create - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT" => "application/json" }

      customer_params = attributes_for(:customer)
      post "/customers.json", params: { customer: customer_params }, headers: headers

      expect(response.body).to include_json(
        id: /\d/,  # expressão regular indicando um número
        name: customer_params[:name],
        email: customer_params.fetch(:email)
      )
    end

    it 'update - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT" => "application/json" }

      customers = Customer.first
      customers.name += " - ATUALIZADO"

      patch "/customers/#{customers.id}.json", params: { customer: customers.attributes }, headers: headers

      expect(response.body).to include_json(
        id: /\d/,
        name: customers.name,
        email: customers.email
      )
    end

    it 'destroy - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT" => "application/json" }
      customers = Customer.first
      except{ delete "/customers/#{customers.id}.json", headers: headers }.to change(Customer, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end
