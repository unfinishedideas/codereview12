require 'rails_helper'

describe "post a park route", :type => :request do

  before do
    post '/parks', params: { :name => 'Da Best Park', :state => 'Alaska', :national => true }
  end

  it 'returns the park name' do
    expect(JSON.parse(response.body)['name']).to eq('Da Best Park')
  end

  it 'returns the park state' do
    expect(JSON.parse(response.body)['state']).to eq('Alaska')
  end

  it 'returns the park national status' do
    expect(JSON.parse(response.body)['national']).to eq(true)
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
