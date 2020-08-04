require 'rails_helper'

RSpec.describe 'background endpoint', type: :request do
  it 'returns background image url for a location' do
    get '/api/v1/background?location=denver,co'

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes]).to have_key(:background_image_url)
    expect(json[:data][:attributes][:background_image_url]).not_to be_nil
  end
end
