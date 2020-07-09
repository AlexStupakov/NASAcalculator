require_relative '../fuel_calculation'

RSpec.describe FuelCalculation do

  describe 'method calculate_one_action_fuel' do
    it do
      expect(FuelCalculation).to respond_to(:calculate_one_action_fuel)
    end

    it do
      expect(FuelCalculation.calculate_one_action_fuel(28801, 9.807, :land)).to eq 13447
    end
  end

  describe 'method calculate_whole_way_fuel' do
    it do
      expect(FuelCalculation).to respond_to(:calculate_whole_way_fuel)
    end

    it do
      expect(FuelCalculation.calculate_whole_way_fuel(28801, [[:land, 9.807]])).to eq 13447
    end
  end
end
