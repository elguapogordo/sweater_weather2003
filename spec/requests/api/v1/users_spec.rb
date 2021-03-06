require 'rails_helper'

RSpec.describe 'users endpoint', type: :request do
  it 'creates and validates users' do

    post '/api/v1/users', params: {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    expect(response.status).to eq(201)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to eq('users')
    expect(json[:data][:attributes].length).to eq(2)
    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes][:email]).to eq('whatever@example.com')
    expect(json[:data][:attributes]).to have_key(:api_key)
    expect(json[:data][:attributes][:api_key]).not_to be_nil
  end

  it 'validates email presence' do

    post '/api/v1/users', params: {
      password: 'password',
      password_confirmation: 'password'
    }

    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:error][0]).to include('Email can\'t be blank')
  end

  it 'validates email uniqueness' do

    User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')

    post '/api/v1/users', params: {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:error][0]).to include('Email has already been taken')
  end

  it 'validates password presence' do

    post '/api/v1/users', params: {
      email: 'whatever@example.com'
    }

    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:error][0]).to include('Password can\'t be blank')
  end

  it 'validates password confirmation' do

    post '/api/v1/users', params: {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'tomato bisque'
    }

    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:error][0]).to include('Password confirmation doesn\'t match Password')
  end

end
