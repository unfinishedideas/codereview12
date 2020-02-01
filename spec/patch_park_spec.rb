require 'rails_helper'
require 'pry'

describe "patch a park route", :type => :request do
  park_id = 0;

  before(:all) do
    post '/auth/register', params: { :name => 'test_user', :password => '123', :email => 'test@test.com'}
    post '/auth/login', params: { :name => 'test_user', :password => '123', :email => 'test@test.com'}
  end

  before do
    post '/parks', params: { :name => 'Da Best Park', :state => 'Alaska', :national => true }
    get '/parks/?name=Da Best Park'
    park_id = JSON.parse(response.body).first.fetch("id")
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
