class Trail
  attr_reader :name, :summary, :difficulty, :location, :distance_to_trail

  def initialize(trail_info)
    binding.pry
    @name = trail_info[:name]
    @summary = trail_info[:summary]
    @difficulty = trail_info[:difficulty]
    @location = trail_info[:location]
    @distance_to_trail = # GET DISTANCE BLAAARGH
  end
end
