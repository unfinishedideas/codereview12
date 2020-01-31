# require 'rails_helper'
# require 'pry'
#
# describe "delete park route", :type => :request do
#   let!(:parks) { FactoryBot.create_list(:park, 1)}
#
#   before { get '/parks'}
#
#   it 'should delete a park' do
#     expect(JSON.parse(response.body).size).to eq(0)
#   end
#
#   it 'returns status code 200' do
#     expect(response).to have_http_status(:success)
#   end
# end
