require 'rails_helper'

RSpec.describe 'trails endpoint', type: :request do
  it 'returns trails info for a location' do
    get '/api/v1/trails?location=denver,co'

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to eq('trail')

    expect(json[:data][:attributes].length).to eq(3)

    expect(json[:data][:attributes]).to have_key(:location)
    expect(json[:data][:attributes][:location]).to eq('denver,co')

    expect(json[:data][:attributes]).to have_key(:forecast)
    expect(json[:data][:attributes][:forecast].length).to eq(2)
    expect(json[:data][:attributes][:forecast]).to have_key(:summary)
    expect(json[:data][:attributes][:forecast][:summary]).not_to be_nil
    expect(json[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(json[:data][:attributes][:forecast][:temperature]).not_to be_nil

    expect(json[:data][:attributes]).to have_key(:trails)
    expect(json[:data][:attributes][:trails][0].length).to eq(5)
    expect(json[:data][:attributes][:trails][0]).to have_key(:name)
    expect(json[:data][:attributes][:trails][0][:name]).not_to be_nil
    expect(json[:data][:attributes][:trails][0]).to have_key(:summary)
    expect(json[:data][:attributes][:trails][0][:summary]).not_to be_nil
    expect(json[:data][:attributes][:trails][0]).to have_key(:difficulty)
    expect(json[:data][:attributes][:trails][0][:difficulty]).not_to be_nil
    expect(json[:data][:attributes][:trails][0]).to have_key(:location)
    expect(json[:data][:attributes][:trails][0][:location]).not_to be_nil
    expect(json[:data][:attributes][:trails][0]).to have_key(:distance_to_trail)
    expect(json[:data][:attributes][:trails][0][:distance_to_trail]).not_to be_nil
  end
end
