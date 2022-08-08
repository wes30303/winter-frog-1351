require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it { should have_many :plants }
    it { should have_many(:plants).through :plant_plots }
  end
end
