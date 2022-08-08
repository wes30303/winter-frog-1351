require 'rails_helper'

RSpec.describe plots: :index do
  it 'take me to plots index page' do
    garden1 = Garden.create!(name: 'best garden', organic: true)
    plot1 = Plot.create!(number: '20', size: 'Large', direction: 'North', garden_id: garden1.id)
    plot2 = Plot.create!(number: '50', size: 'Large', direction: 'North', garden_id: garden1.id)
    plot3 = Plot.create!(number: '13', size: 'Large', direction: 'North', garden_id: garden1.id)
    plant1 = Plant.create!(name: 'dragon', description: 'sweat and good', harvest: 30)
    plant2 = Plant.create!(name: 'apple', description: 'red and round', harvest: 90)
    plant3 = Plant.create!(name: 'orange', description: 'orange and orange', harvest: 40)
    p1 = PlantPlot.create!(plant_id: plant1.id, plot_id: plot1.id)
    p1 = PlantPlot.create!(plant_id: plant2.id, plot_id: plot1.id)
    p1 = PlantPlot.create!(plant_id: plant3.id, plot_id: plot2.id)

    visit '/plots'

    expect(page).to have_content('20')
    expect(page).to have_content('50')
    expect(page).to have_content('13')
    expect(page).to_not have_content('80')
    expect(page).to have_content('dragon')
    expect(page).to have_content('apple')
    expect(page).to have_content('orange')
    expect(page).to_not have_content('banna')
  end

  it 'take me to plots index page and see a delete next to each user' do
    garden1 = Garden.create!(name: 'best garden', organic: true)
    plot1 = Plot.create!(number: '20', size: 'Large', direction: 'North', garden_id: garden1.id)
    plot2 = Plot.create!(number: '50', size: 'Large', direction: 'North', garden_id: garden1.id)
    plot3 = Plot.create!(number: '13', size: 'Large', direction: 'North', garden_id: garden1.id)
    plant1 = Plant.create!(name: 'dragon', description: 'sweat and good', harvest: 30)
    plant2 = Plant.create!(name: 'apple', description: 'red and round', harvest: 90)
    plant3 = Plant.create!(name: 'orange', description: 'orange and orange', harvest: 40)
    p1 = PlantPlot.create!(plant_id: plant1.id, plot_id: plot1.id)
    p1 = PlantPlot.create!(plant_id: plant2.id, plot_id: plot2.id)
    p1 = PlantPlot.create!(plant_id: plant3.id, plot_id: plot3.id)

    visit '/plots'

    within "#plot-#{plot1.id}" do
      expect(page).to have_content('dragon')
      expect(page).to have_link("Remove Plant")
      click_link 'Remove Plant'
      expect(page).to_not have_content('dragon')
    end
  end
end
