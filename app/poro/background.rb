class Background
  attr_reader :id, :background_image_url

  def initialize(city_state)
    @id = nil
    @background_image_url = BackgroundService.new.get_url(city_state)
  end
end
