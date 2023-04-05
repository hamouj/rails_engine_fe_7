class ItemsController < ApplicationController
  def show
    @facade = RailsEngineFacade.new(params)
  end
end