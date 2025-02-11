class RailsEngineService
  
  def all_merchants
    get_url('/api/v1/merchants')
  end

  def merchant_items(merchant_id)
    get_url("/api/v1/merchants/#{merchant_id}/items")
  end

  def all_items
    get_url('/api/v1/items')
  end

  def get_item(item_id)
    get_url("/api/v1/items/#{item_id}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://localhost:3000')
  end
end