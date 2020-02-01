require 'rails_helper'

describe "get all parks route", :type => :request do
  let!(:parks) { FactoryBot.create_list(:park, 20)}

  before do
    user = FactoryBot.create(:user)
    allow(AuthorizeApiRequest).to receive(:call).and_return(user)
    # request.headers['Authorization'] = auth_token # this is not required anymore the authentication is skipped
    get '/parks'
  end

  it 'returns all parks' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

# https://stackoverflow.com/questions/48031732/how-to-add-auth-token-to-each-http-rspec-test-header
