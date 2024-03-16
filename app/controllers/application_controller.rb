class ApplicationController < ActionController::Base
    def index
        @transit_performances = TransitPerformance.all
    end
end
