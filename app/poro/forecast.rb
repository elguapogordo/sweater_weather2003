class Forecast
  attr_reader :id, :location, :current, :hourly, :daily

  def initialize(city_state)
    @id = nil
    location_full = LocationService.new.get_coordinates(city_state)
    @location = requested_loc(location_full)
    @weather = OpenWeatherService.new.get_forecast(location_full[:coordinates])
    @current = requested_current(@weather[:current])
    @hourly = requested_hourly(@weather[:hourly][0..7])
    @daily = requested_daily(@weather[:daily][0..5])
  end

  def requested_loc(location)
    {
      city: location[:city],
      state: location[:state],
      country: location[:country]
    }
  end

  def requested_current(current)
    {
      time: current[:dt],
      temp: current[:temp],
      feels_like: current[:feels_like],
      humidity: current[:humidity],
      visibility: current[:visibility],
      uv_index: current[:uvi],
      sunrise: current[:sunrise],
      sunset: current[:sunset],
      weather_description: current[:weather][0][:description],
      weather_icon_id: current[:weather][0][:icon]
    }
  end

  def requested_hourly(hourlies)
    hourlies.map do |hourly|
      {
        time: hourly[:dt],
        temp: hourly[:temp],
        weather_description: hourly[:weather][0][:description],
        weather_icon_id: hourly[:weather][0][:icon]
      }
    end
  end

  def requested_daily(dailies)
    dailies.map do |daily|
      {
        date: daily[:dt],
        temp_high: daily[:temp][:max],
        temp_low: daily[:temp][:min],
        weather_description: daily[:weather][0][:main],
        weather_icon_id: daily[:weather][0][:icon],
        precip_mm: daily[:rain]
      }
    end
  end
end
