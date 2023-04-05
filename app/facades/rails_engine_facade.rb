class RailsEngineFacade

  def initialize(params)
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
end