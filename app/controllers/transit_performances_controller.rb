class TransitPerformancesController < ApplicationController
    def index
        # Use page and per method to show different pages.
        @transit_performances = TransitPerformance.page(params[:page]).per(20)
    end
    def about
    end
    def show
        @transit_performance = TransitPerformance.find(params[:id])
        @driver = @transit_performance.driver
        @day_type = DayType.find(@transit_performance.day_id)
    end
  end