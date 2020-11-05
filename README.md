# Sweater Weather
This is a back end API based application for an imaginary front end. It uses Ruby on Rails with a PostgresQL database and has the following endpoints:  
  * Retrieve specific weather data for a city: `GET /api/v1/forecast?location=city,st`
    * Current weather
    * Daily weather for the next 5 days
    * Hourly weather for the next 8 hours
  * Background image for a city `GET /api/v1/backgrounds?location=city,st`
  * Visitor registration `POST /api/v1/users`
  * User login `POST /api/v1/sessions`
  * Road trip `POST /api/v1/road_trip`

All responses are formatted to JSON:API v1.0 specifications.  
Tested with SimpleCov `351 / 351 LOC (100.0%) covered.`

## Environment
* set up with `rails new sweater_weather --api --database=postgresql -T -M`
* Ruby version 2.5.3
* Rails version 6.0.3.2
* Uses FastJSON API gem (no longer maintained)

## Installation
Clone into a local repository  
CD to repository in terminal  
Install gems
```
bundle
```
Set up database
```
rails db:{create,migrate}
```
Install application.yml file through figaro gem
```
bundle exec figaro install
```
Add API keys to application.yml
```
google_key: (Google Maps Geocoding API key)
openweather_key: (OpenWeather One Call API key)
hikingproject_key: (Hiking Project API key)
unsplash_key: (Unsplash API key)
```

## Usage
Run the server
```
rails s
```
Hit your endpoints with Postman or favorite API dev tool
#### Forecast (/forecast)
```
GET localhost:3000/api/v1/forecast?location=denver,co
```
#### Backgrounds (/backgrounds)
```
GET localhost:3000/api/v1/backgrounds?location=denver,co
```
#### Registration (/users)
```
POST localhost:3000/api/v1/users
example:
{
  "email": "whatever@example.com",
  "password": "password"
  "password_confirmation": "password"
}
```
#### Login (/sessions)
```
POST localhost:3000/api/v1/sessions
example:
{
  "email": "whatever@example.com",
  "password": "password"
}
```
#### Road Trip (/road_trip, must pass payload in request body, not params)
```
`POST localhost:3000/api/v1/road_trip`
example body:
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
## Contributing
This was a solo project for an imaginary front end application. It does make real API calls and return JSON (you can test these endpoints at `https://sweater-weather-jg.herokuapp.com/api/v1/endpoint`  
If you have any suggestions or code submissions, feel free to submit a pull request or reach out to me to discuss them.