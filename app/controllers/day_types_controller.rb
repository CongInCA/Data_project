class DayTypesController < ApplicationController
  def index
    @day_types = DayType.all
  end
  def show
    @day_type = DayType.find(params[:id])
    @transit_performances = @day_type.transit_performances
  end
end
