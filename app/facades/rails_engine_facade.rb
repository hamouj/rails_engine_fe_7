class RailsEngineFacade
  attr_reader :merchant_id,
              :name

  def initialize(params)
    @merchant_id = params[:merchant_id]
    @item_id = params[:item_id]
    @name = params[:name]
  end

  def service 
    @_service ||= RailsEngineService.new
  end

  def all_merchants
    json = service.all_merchants

    json[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end

  def merchant_items
    json = service.merchant_items(@merchant_id)

    json[:data].map do |item_data|
      Item.new(item_data)
    end
  end

  def all_items
    json = service.all_items

    json[:data].map do |item_data|
      Item.new(item_data)
    end
  end

  def item
    json = service.get_item(@item_id)

    Item.new(json[:data])
  end

  def merchant_by_name
    all_merchants.select do |merchant|
      merchant.name.downcase.include?(@name.downcase)
    end
  end
end