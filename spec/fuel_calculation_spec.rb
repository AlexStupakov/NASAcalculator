require_relative '../fuel_calculation'

RSpec.describe FuelCalculation do

  describe 'method calculate_one_action_fuel' do
    it 'should respond to calculate_one_action_fuel' do
      expect(FuelCalculation).to respond_to(:calculate_one_action_fuel)
    end

    it 'should return correct result' do
      expect(FuelCalculation.calculate_one_action_fuel(28801, 9.807, :land)).to eq 13447
    end
  end

  describe 'method calculate_whole_way_fuel' do
    it 'should respond to calculate_whole_way_fuel' do
      expect(FuelCalculation).to respond_to(:calculate_whole_way_fuel)
    end

    it 'should return correct result' do
      expect(FuelCalculation.calculate_whole_way_fuel(28801, [[:land, 9.807]])).to eq 13447
    end
  end

  it 'report_fuel_weight' do
    expect(FuelCalculation.report_fuel_weight(28801, [[:land, 9.807]])).to eq 'Space ship with weight 28801, that going to trip [[:land, 9.807]], should have 13447 of fuel.'
  end
end
