class MerchantsController < ApplicationController
  def index
    @facade = RailsEngineFacade.new(params)
  end

  def show
  end
end