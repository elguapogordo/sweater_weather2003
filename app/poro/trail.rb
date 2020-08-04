class Trail
  attr_reader :name, :summary, :difficulty, :location, :distance_to_trail

  def initialize(trail_info, origin)
    @name = trail_info[:name]
    @summary = trail_info[:summary]
    @difficulty = trail_info[:difficulty]
    @location = trail_info[:location]
    @distance_to_trail = DirectionsService.new.trail_distance(trail_info, origin).to_f.to_s
  end
end
