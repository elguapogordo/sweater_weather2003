require 'rails_helper'

RSpec.describe 'sessions endpoint', type: :request do
  it 'validates credentials and returns api_key' do

    User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')

    post '/api/v1/sessions', params: {
      email: 'whatever@example.com',
      password: 'password'
    }

    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to eq('users')
    expect(json[:data][:attributes].length).to eq(2)
    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes][:email]).to eq('whatever@example.com')
    expect(json[:data][:attributes]).to have_key(:api_key)
    expect(json[:data][:attributes][:api_key]).not_to be_nil
  end

  it 'validates existence of user' do

    post '/api/v1/sessions', params: {
      email: 'whatever@example.com',
      password: 'password'
    }

    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:error]).to eq('User not found')
  end

  it 'gives error for invalid password' do

    User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')

    post '/api/v1/sessions', params: {
      email: 'whatever@example.com',
      password: 'tomato bisque'
    }

    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:error]).to eq('Password authentication failed')
  end
end
