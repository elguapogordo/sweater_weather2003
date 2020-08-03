class Forecast
  attr_reader :id, :location, :current, :hourly, :daily

  def initialize(city_state)
    @id = nil
    @location = LocationService.new.get_coordinates(city_state)
    @weather = OpenWeatherService.new.get_forecast(@location[:coordinates])
    @current = @weather[:current]
    @hourly = @weather[:hourly][0..7]
    @daily = @weather[:daily][0..5]
  end
end
