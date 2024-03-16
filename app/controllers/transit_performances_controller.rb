class TransitPerformancesController < ApplicationController
    def index
      @transit_performances = TransitPerformance.all
    end
    def about
    end
  end