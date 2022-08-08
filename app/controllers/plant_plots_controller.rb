class PlantPlotsController < ApplicationController
  def destroy
    plant = Plant.find(params[:plant_id])
    plantplots = plant.plant_plots.find_by(plot_id: params[:plot_id])
    plantplots.destroy
    redirect_to '/plots'
  end
end
