class TrailsList
  attr_reader :id, :location, :forecast, :trails

  def initialize(city_state)
    @id = nil
    @location = LocationService.new.get_coordinates(city_state)
    weather = OpenWeatherService.new.get_forecast(@location[:coordinates])
    @forecast = weather[:current]
    binding.pry
    @trails = TrailsService.new.get_trails(@location[:coordinates])
  end
end
