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


describe "post a park with no national status", :type => :request do

  before do
      post '/parks', params: { :name => 'Da Best Park Again', :state => 'Hawaii'}
  end

  it 'returns the park with no national' do
    expect(JSON.parse(response.body)['name']).to eq('Da Best Park Again')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end


# describe "bad post call", :type => :request do
#
#   it 'returns an exception if name is blank' do
#     post '/parks', params: { :name => '', :state => 'Alabama'}
#     binding.pry
#     expect(response).to raise_error(Errors::StateNameNotFound)
#   end
#   it 'returns an exception if state is blank' do
#     post '/parks', params: { :name => 'Da Best Park III', :state => ''}
#     expect(response).to raise_error(Errors::StateNameNotFound)
#   end
#   it 'returns an exception if both name and state is blank' do
#     post '/parks', params: { :name => '', :state => ''}
#     expect(response).to raise_error(Errors::StateNameNotFound)
#   end
# end
