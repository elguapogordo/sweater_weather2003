require 'rails_helper'

RSpec.describe 'trails endpoint', type: :request do
  it 'returns trails info for a location' do
    get '/api/v1/trails?location=denver,co'

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes].size).to eq(3)
    expect(json[:data][:attributes][:location][:city]).to eq('Denver')
    expect(json[:data][:attributes][:forecast][:temp].class).to eq(Float)
    expect(json[:data][:attributes][:trails][0][:name]).to_not be_nil
  end
end
