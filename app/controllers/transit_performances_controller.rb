class TransitPerformancesController < ApplicationController
    def index
        # if params[:query].present?
        #     @transit_performances = TransitPerformance.where("route_number LIKE ?", "%#{params[:query]}%").page(params[:page]).per(20)
        #     render :index
        #   else
        #     @transit_performances = TransitPerformance.page(params[:page]).per(20)
        #   end
        @transit_performances = TransitPerformance.search(params[:search]).page(params[:page]).per(20)
      end
    def about
    end
    def show
        @transit_performance = TransitPerformance.find(params[:id])
        @driver = @transit_performance.driver
        @day_type = DayType.find(@transit_performance.day_id)
    end
  end