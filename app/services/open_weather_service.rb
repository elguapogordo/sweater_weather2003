class OpenWeatherService
  def get_forecast(coordinates)
    response = conn.get('data/2.5/onecall') do |req|
      req.params['lat'] = coordinates[:lat]
      req.params['lon'] = coordinates[:lng]
      req.params['units'] = 'imperial'
      req.params['exclude'] = 'minutely'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.openweathermap.org') do |f|
      f.params['appid'] = ENV['openweather_key']
    end
  end
end
