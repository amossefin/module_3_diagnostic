class NrelService
  def initialize
    @conn = Faraday.new(url: 'https://developer.nrel.gov') do |faraday|
      faraday.headers["X-API-KEY"] = ENV["pusher_key"]
      faraday.adapter Faraday.default_adapter
  end
end
