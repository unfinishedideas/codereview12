require 'rails_helper'
require 'pry'

describe "delete park route", :type => :request do
  park_id = 0;

  before do
    post '/parks', params: { :name => 'Da Best Park III', :state => 'Alaska', :national => true }
    park_id = JSON.parse(response.body).fetch("id")
  end

  it 'should delete a park' do
    delete "/parks/#{park_id}"
    get '/parks'
    expect(JSON.parse(response.body).size).to eq(0)
  end

  it 'returns status code 200' do
    delete "/parks/#{park_id}"
    expect(response).to have_http_status(:success)
  end

end
