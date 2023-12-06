class MapquestService
  def geocode_address(location)
    get_json("/geocoding/v1/address?location=#{location}")
  end

  private

  def conn
    Faraday.new('http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
