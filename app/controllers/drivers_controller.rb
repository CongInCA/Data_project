class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end
  def show
    @driver = Driver.find(params[:id])
    @transit_performances = @driver.transit_performances
  end
end
