class TrailList
  attr_reader :id, :location, :forecast, :trails

  def initialize(city_state)
    @id = nil
    @location = city_state
    @loc = LocationService.new.get_coordinates(city_state)
    weather = OpenWeatherService.new.get_forecast(@loc[:coordinates])
    @forecast = trail_current(weather[:current])
    trail_list = TrailsService.new.get_trails(@loc[:coordinates])
    @trails = summarize(trail_list[:trails], @loc[:coordinates])
  end

  def summarize(trails, origin)
    trails.map do |trail|
      Trail.new(trail, origin)
    end
  end

  def trail_current(weather)
    {
      summary: weather[:weather][0][:description],
      temperature: weather[:temp].to_s
    }
  end
end
