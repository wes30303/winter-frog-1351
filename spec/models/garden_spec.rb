require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plant_plots).through :plots }
    it { should have_many(:plants).through :plant_plots }
  end

  describe 'instance methods' do

    it "can list all of the plants that take less then 100 days and unique" do
      garden1 = Garden.create!(name: 'best garden', organic: true)
      garden2 = Garden.create!(name: 'Happy Place', organic: true)
      plot1 = Plot.create!(number: '20', size: 'Large', direction: 'North', garden_id: garden1.id)
      plot2 = Plot.create!(number: '50', size: 'Large', direction: 'North', garden_id: garden1.id)
      plot3 = Plot.create!(number: '13', size: 'Large', direction: 'North', garden_id: garden1.id)
      plant1 = Plant.create!(name: 'dragon', description: 'sweat and good', harvest: 30)
      plant2 = Plant.create!(name: 'apple', description: 'red and round', harvest: 90)
      plant3 = Plant.create!(name: 'orange', description: 'orange and orange', harvest: 40)
      plant6 = Plant.create!(name: 'pinapple', description: 'yellow and juicy', harvest: 200)
      p1 = PlantPlot.create!(plant_id: plant1.id, plot_id: plot1.id)
      p1 = PlantPlot.create!(plant_id: plant2.id, plot_id: plot1.id)
      p1 = PlantPlot.create!(plant_id: plant3.id, plot_id: plot2.id)
      p1 = PlantPlot.create!(plant_id: plant1.id, plot_id: plot2.id)
      p1 = PlantPlot.create!(plant_id: plant6.id, plot_id: plot2.id)

      expect(garden1.unique_and_less_100).to eq([plant1, plant2, plant3])
    end
  end
end
