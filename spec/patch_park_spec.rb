require 'rails_helper'
require 'pry'

describe "patch a park route", :type => :request do
  park_id = 0;
  before do
    post '/parks', params: { :name => 'Da Best Park', :state => 'Alaska', :national => true }
    park_id = JSON.parse(response.body).fetch("id")
  end

  it 'updates the parks name' do
    patch "/parks/#{park_id}", params: { :name => 'Yosemite'}
    get "/parks/#{park_id}"
    expect(JSON.parse(response.body)['name']).to eq('Yosemite')
  end

  it 'returns a successful update message' do
    patch "/parks/#{park_id}", params: { :name => 'Yosemite II'}
    expect(JSON.parse(response.body)['message']).to eq("This park has been updated successfully.")
  end
  it 'returns a 200 status code' do
    patch "/parks/#{park_id}", params: { :name => 'Yosemite II'}
    expect(response).to have_http_status(:success)
  end

  it 'returns an exception if park does not exist' do
    patch "/parks/#{"oooo"}", params: { :name => 'Yosemite II'}
    expect(JSON.parse(response.body)['message']).to eq("Couldn't find Park with 'id'=oooo")
  end
end
