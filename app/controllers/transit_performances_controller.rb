class TransitPerformancesController < ApplicationController
    def index
      @transit_performances = TransitPerformance.all
    end
    def about
    end
    def show
        @transit_performance = TransitPerformance.find(params[:id])
        @driver = @transit_performance.driver
        @day_type = DayType.find(@transit_performance.day_id)
    end
  end