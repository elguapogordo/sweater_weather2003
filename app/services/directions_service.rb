class DirectionsService
  def trail_distance(trail, origin)
    response = conn.get('maps/api/directions/json') do |req|
      req.params['origin'] = "#{trail[:latitude]},#{trail[:longitude]}"
      req.params['destination'] = "#{origin[:lat]},#{origin[:lng]}"
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:routes][0][:legs][0][:distance][:text]
  end

  def conn
    Faraday.new('https://maps.googleapis.com') do |f|
      f.params['key'] = ENV['google_key']
    end
  end
end
