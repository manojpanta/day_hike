class TrailsController < ApplicationController

  def show
    @trail = Trail.find(params[:id])
    @total_trips = @trail.total_trips
    @trips = @trail.trips
  end
end
