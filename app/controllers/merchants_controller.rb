class MerchantsController < ApplicationController
  def index
    @facade = RailsEngineFacade.new(params)
  end

  def show
    @facade = RailsEngineFacade.new(params)
  end
end