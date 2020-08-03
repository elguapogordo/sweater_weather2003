class LocationService
  def get_coordinates(location)
    response = conn.get('maps/api/geocode/json') do |req|
      req.params['address'] = location
    end
    parse_coordinates(response)
  end

  def conn
    Faraday.new('https://maps.googleapis.com') do |f|
      f.params['key'] = ENV['google_key']
    end
  end

  def parse_coordinates(response)
    json = JSON.parse(response.body, symbolize_names: true)
    {
      coordinates: json[:results][0][:geometry][:location],
      city: json[:results][0][:address_components][0][:long_name],
      state: json[:results][0][:address_components][2][:short_name],
      country: json[:results][0][:address_components][3][:long_name]
    }
  end
end
