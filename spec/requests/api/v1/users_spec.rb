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

    expect(user[:type]).to eq('users')
    expect(user[:attributes].length).to eq(2)
    expect(user[:attributes]).to have_key(:email)
    expect(user[:attributes][:email]).to eq('whatever@example.com')
    expect(user[:attributes]).to have_key(:api_key)
    expect(user[:attributes][:api_key]).not_to be_nil
  end

  it 'validates email uniqueness' do
    User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
  end
end
