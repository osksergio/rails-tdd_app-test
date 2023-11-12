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
  end
end
