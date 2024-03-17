class TransitPerformancesController < ApplicationController
    def index
        if params[:query].present?
            @transit_performances = TransitPerformance.where("route_name LIKE ?", "%#{params[:query]}%").page(params[:page]).per(20)
          else
            @transit_performances = TransitPerformance.page(params[:page]).per(20)
          end
      end
    def about
    end
    def show
        @transit_performance = TransitPerformance.find(params[:id])
        @driver = @transit_performance.driver
        @day_type = DayType.find(@transit_performance.day_id)
    end
    # private

    # def transit_performance_params
    #     params.require(:transit_performance).permit(:query)
    # end
  end