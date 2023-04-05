class WelcomeController < ApplicationController
  def index
    if params[:name]
      @facade = RailsEngineFacade.new(params)

      flash[:message] = 'No matches found' if @facade.merchant_by_name.empty?
    end
  end
end