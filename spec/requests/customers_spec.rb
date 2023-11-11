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
                                              email: "teste@silva.com",
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
                                 email: (be_a_kind_of String),
                                            ])
    end

    it "uses be_kind_of in the include_json (id = 1)" do
      get "/customers/1.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(
        id: /\d/,  # expressão regular indicando um número
        name: (be_a_kind_of String),
        email: (be_a_kind_of String),
      )
    end
  end
end
