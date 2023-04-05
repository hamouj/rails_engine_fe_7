class RailsEngineService

  def all_merchants
    get_url('/api/v1/merchants')
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://localhost:3000')
  end
end