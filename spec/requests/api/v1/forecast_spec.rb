require 'rails_helper'

RSpec.describe 'forecast endpoint', type: :request do
  it 'returns forecast info for a location' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to eq('forecast')

    expect(json[:data][:attributes].length).to eq(4)

    expect(json[:data][:attributes]).to have_key(:location)
    expect(json[:data][:attributes][:location].length).to eq(3)
    expect(json[:data][:attributes][:location]).to have_key(:city)
    expect(json[:data][:attributes][:location][:city]).not_to be_nil
    expect(json[:data][:attributes][:location]).to have_key(:state)
    expect(json[:data][:attributes][:location][:state]).not_to be_nil
    expect(json[:data][:attributes][:location]).to have_key(:country)
    expect(json[:data][:attributes][:location][:country]).not_to be_nil

    expect(json[:data][:attributes]).to have_key(:current)
    expect(json[:data][:attributes][:current].length).to eq(10)
    expect(json[:data][:attributes][:current]).to have_key(:time)
    expect(json[:data][:attributes][:current][:time]).not_to be_nil
    expect(json[:data][:attributes][:current]).to have_key(:temp)
    expect(json[:data][:attributes][:current][:temp]).not_to be_nil
    expect(json[:data][:attributes][:current]).to have_key(:feels_like)
    expect(json[:data][:attributes][:current][:feels_like]).not_to be_nil
    expect(json[:data][:attributes][:current]).to have_key(:humidity)
    expect(json[:data][:attributes][:current][:humidity]).not_to be_nil
    expect(json[:data][:attributes][:current]).to have_key(:visibility)
    expect(json[:data][:attributes][:current][:visibility]).not_to be_nil
    expect(json[:data][:attributes][:current]).to have_key(:uv_index)
    expect(json[:data][:attributes][:current][:uv_index]).not_to be_nil
    expect(json[:data][:attributes][:current]).to have_key(:sunrise)
    expect(json[:data][:attributes][:current][:sunrise]).not_to be_nil
    expect(json[:data][:attributes][:current]).to have_key(:sunset)
    expect(json[:data][:attributes][:current][:sunset]).not_to be_nil
    expect(json[:data][:attributes][:current]).to have_key(:weather_description)
    expect(json[:data][:attributes][:current][:weather_description]).not_to be_nil
    expect(json[:data][:attributes][:current]).to have_key(:weather_icon_id)
    expect(json[:data][:attributes][:current][:weather_icon_id]).not_to be_nil

    expect(json[:data][:attributes]).to have_key(:hourly)
    expect(json[:data][:attributes][:hourly].size).to eq(8)
    expect(json[:data][:attributes][:hourly][0].length).to eq(4)
    expect(json[:data][:attributes][:hourly][0]).to have_key(:time)
    expect(json[:data][:attributes][:hourly][0][:time]).not_to be_nil
    expect(json[:data][:attributes][:hourly][0]).to have_key(:temp)
    expect(json[:data][:attributes][:hourly][0][:temp]).not_to be_nil
    expect(json[:data][:attributes][:hourly][0]).to have_key(:weather_description)
    expect(json[:data][:attributes][:hourly][0][:weather_description]).not_to be_nil
    expect(json[:data][:attributes][:hourly][0]).to have_key(:weather_icon_id)
    expect(json[:data][:attributes][:hourly][0][:weather_icon_id]).not_to be_nil

    expect(json[:data][:attributes]).to have_key(:daily)
    expect(json[:data][:attributes][:daily].size).to eq(6)
    expect(json[:data][:attributes][:daily][0].length).to eq(6)
    expect(json[:data][:attributes][:daily][0]).to have_key(:date)
    expect(json[:data][:attributes][:daily][0][:date]).not_to be_nil
    expect(json[:data][:attributes][:daily][0]).to have_key(:temp_high)
    expect(json[:data][:attributes][:daily][0][:temp_high]).not_to be_nil
    expect(json[:data][:attributes][:daily][0]).to have_key(:temp_low)
    expect(json[:data][:attributes][:daily][0][:temp_low]).not_to be_nil
    expect(json[:data][:attributes][:daily][0]).to have_key(:weather_description)
    expect(json[:data][:attributes][:daily][0][:weather_description]).not_to be_nil
    expect(json[:data][:attributes][:daily][0]).to have_key(:weather_icon_id)
    expect(json[:data][:attributes][:daily][0][:weather_icon_id]).not_to be_nil
    expect(json[:data][:attributes][:daily][0]).to have_key(:precip_mm)
  end
end
