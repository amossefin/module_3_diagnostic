class NrelService
  def initialize(zip)
    @zip = zip
    @conn = Faraday.new(url: 'https://developer.nrel.gov') do |faraday|
      faraday.headers["X-API-KEY"] = ENV["pusher_key"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def search_stations
    get_url("/api/alt-fuel-stations/v1/search?zip=#{@zip}")
  end

  def self.search_stations(zip)
    new(zip).search_stations

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

end
