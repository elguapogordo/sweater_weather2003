class TrailsList
  attr_reader :id, :location, :forecast, :trails

  def initialize(city_state)
    @id = nil
    @location = LocationService.new.get_coordinates(city_state)
    weather = OpenWeatherService.new.get_forecast(@location[:coordinates])
    @forecast = weather[:current]
    trailslist = TrailsService.new.get_trails(@location[:coordinates])
    @trails = summarize(trailslist[:trails], @location[:coordinates])
  end

  def summarize(trails, origin)
    trails.map do |trail|
      Trail.new(trail, origin)
    end
  end
end
