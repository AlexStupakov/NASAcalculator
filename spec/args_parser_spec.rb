# allow(ARGV).to receive(:join).and_return('whatever')
require_relative '../args_parser'

RSpec.describe ArgsParser do
  describe 'method get_ship_weight_integer' do
    it do
      expect(ArgsParser).to respond_to(:get_ship_weight_integer)
    end

    it do
      expect(ArgsParser.get_ship_weight_integer('28801, [[:land, 9.807]]')).to eq 28801
    end

    it do
      expect(ArgsParser.get_ship_weight_integer(', [[:land, 9.807]]')).to eq 0
    end

    it do
      expect(ArgsParser.get_ship_weight_integer('[[:land, 9.807]]')).to eq 0
    end

    it do
      expect(ArgsParser.get_ship_weight_integer('bla')).to eq 0
    end
  end

  describe 'method calculate_whole_way_fuel' do
    it do
      expect(ArgsParser).to respond_to(:get_flight_route_array)
    end

    it do
      expect(ArgsParser.get_flight_route_array('28801, [[:land, 9.807]]')).to eq [[:land, 9.807]]
    end

    it do
      expect(ArgsParser.get_flight_route_array('[[:land, 9.807]]')).to eq [[:land, 9.807]]
    end

    it do
      expect(ArgsParser.get_flight_route_array('1, 2, 3, [:land, 9.807]')).to eq [[:land, 9.807]]
    end

    it do
      expect(ArgsParser.get_flight_route_array('28801, [[:launch, 9.807]]')).to eq [[:launch, 9.807]]
    end

    it do
      expect(ArgsParser.get_flight_route_array('28801, [[:bla, 9.807]]')).to eq []
    end

    it do
      expect(ArgsParser.get_flight_route_array('28801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]'))
        .to eq [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]
    end
  end
end
