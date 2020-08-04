class BackgroundService
  def get_url(location)
    response = conn.get('search/photos') do |req|
      req.params['query'] = location
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results][0][:urls][:full]
  end

  private

  def conn
    Faraday.new('https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['unsplash_key']
      f.headers['Accept-Version'] = 'v1'
    end
  end
end
