require 'rails_helper'

RSpec.describe 'users endpoint', type: :request do
  it 'creates and validates users' do

    post '/api/v1/users', params: {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data][:type]).to eq('users')
    expect(user[:data][:attributes].length).to eq(2)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to eq('whatever@example.com')
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:api_key]).not_to be_nil
  end

  xit 'validates email uniqueness' do
    User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
  end
end
