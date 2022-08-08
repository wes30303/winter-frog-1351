require 'rails_helper'

RSpec.describe garden: :show do
  it 'take me to garden show page and list all of the plants but no duplicutes' do
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

    visit "/gardens/#{garden1.id}"

    expect(page).to have_content('dragon')
    expect(page).to have_content('apple', count: 1)
    expect(page).to have_content('orange')
    expect(page).to_not have_content('pinapple')

  end

  it 'list of plants is sorted by the number of plants that appear in any of that gardens plots from most to least' do
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

    visit "/gardens/#{garden1.id}"

    expect(page).to have_content('dragon')
    expect(page).to have_content('apple', count: 1)
    expect(page).to have_content('orange')
    expect(page).to_not have_content('pinapple')

  end
end
