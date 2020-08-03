require 'rails_helper'

RSpec.describe 'trails endpoint', type: :request do
  it 'returns trails info for a location' do
    get '/api/v1/trails?location=denver,co'

    expect(response).to be_successful
    json = JSON.parse(response.body)
    expect(json[:data][:attributes].size).to eq(3)
  end
end
