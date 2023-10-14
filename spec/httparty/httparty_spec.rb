describe 'httparty' do
  #it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body] } do
  it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts', :record => :new_episodes } do
    #stub_request(:get, "https://jsonplaceholder.typicode.com/posts/1").
    #  to_return(status: 200, body: "", headers: { 'content-type': 'application/json'

    # primeira versão do teste usando a gem vcr
    # ainda não estava configurado vcr com metadados do RSpec
    # -------------------------------------------------------
    #VCR.use_cassette("jsonplaceholder/posts") do
    #  response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/1')
    #  content_type = response.headers['content-type']
    #  expect(content_type).to match(/application\/json/)
    #end

    #response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/1')
    response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/4")
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end
end