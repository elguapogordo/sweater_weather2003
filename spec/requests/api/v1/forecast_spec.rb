require 'rails_helper'

RSpec.describe 'forecast endpoint', type: :request do
  it 'returns forecast info for a location' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    json = JSON.parse(response.body)
    expect(json[:data][:attributes].size).to eq(4)
  end
end
