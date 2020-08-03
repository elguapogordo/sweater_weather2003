class TrailsService
  def get_trails(coordinates)
    response = conn.get('data/get-trails') do |req|
      req.params['lat'] = coordinates[:lat]
      req.params['lon'] = coordinates[:lng]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://www.hikingproject.com') do |f|
      f.params['key'] = ENV['hikingproject_key']
    end
  end
end
