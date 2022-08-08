class Garden < ApplicationRecord
  has_many :plots
  has_many :plant_plots, through: :plots
  has_many :plants, through: :plant_plots

  def unique_and_less_100
    plants.select('plants.*')
    .where('plants.harvest < ?', '100')
    .distinct
  end
end
