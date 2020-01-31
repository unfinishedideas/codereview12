require 'rails_helper'

describe "post a park route", :type => :request do

  before do
    post '/parks', params: { :name => 'Da Best Park', :state => 'Alaska', :national => true }
  end

  it 'returns a park created message' do
    expect(JSON.parse(response.body)['message']).to eq("Park has been created successfully.")
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end


describe "post a park with no national status", :type => :request do

  before do
      post '/parks', params: { :name => 'Da Best Park Again', :state => 'Hawaii'}
  end

  it 'returns a park created message' do
    expect(JSON.parse(response.body)['message']).to eq("Park has been created successfully.")
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end


describe "bad post call", :type => :request do

  it 'returns an exception if name is blank' do
    post '/parks', params: { :name => '', :state => 'Alabama'}
    expect(JSON.parse(response.body)['message']).to eq("Validation failed: Name can't be blank")
    expect(response).to have_http_status(:not_found)
  end

  it 'returns an exception if state is blank' do
    post '/parks', params: { :name => 'Oogity', :state => ''}
    expect(JSON.parse(response.body)['message']).to eq("Validation failed: State can't be blank")
    expect(response).to have_http_status(:not_found)
  end

  it 'returns an exception if both name and state is blank' do
    post '/parks', params: { :name => '', :state => ''}
    expect(JSON.parse(response.body)['message']).to eq("Validation failed: Name can't be blank, State can't be blank")
    expect(response).to have_http_status(:not_found)
  end
end
