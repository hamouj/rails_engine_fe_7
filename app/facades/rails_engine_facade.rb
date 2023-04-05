class RailsEngineFacade
  attr_reader :merchant_id

  def initialize(params)
    @merchant_id = params[:merchant_id]
    @item_id = params[:item_id]
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

  def item
    json = service.get_item(@item_id)

    Item.new(json[:data])
  end
end