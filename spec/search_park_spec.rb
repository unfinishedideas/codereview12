require 'rails_helper'
require 'pry'

describe "search park route", :type => :request do

  before do
    post '/parks', params: { :name => 'Whoville', :state => 'Oregon', :national => true }
    post '/parks', params: { :name => 'Funtimes', :state => 'Oregon', :national => false }
    post '/parks', params: { :name => 'Da Best Park Again', :state => 'Nebraska', :national => true }
  end

  it 'should find a park by name' do
    get '/parks/?name=Da Best Park Again'
    expect(JSON.parse(response.body).first['name']).to eq('Da Best Park Again')
  end

  it 'should find a list of parks by state' do
    get '/parks/?state=Oregon'
    expect(JSON.parse(response.body).size).to eq(2)
  end

  it 'should find a list of parks by national status' do
    get '/parks/?national=true'
    expect(JSON.parse(response.body).size).to eq(2)
  end

  it 'returns status code 200' do
    get '/parks/?national=true'
    expect(response).to have_http_status(:success)
  end

end
