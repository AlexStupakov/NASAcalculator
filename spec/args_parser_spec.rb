# allow(ARGV).to receive(:join).and_return('whatever')
require_relative '../args_parser'

RSpec.describe ArgsParser do
  describe 'method get_ship_weight_integer' do
    it 'should respond to get_ship_weight_integer' do
      expect(ArgsParser).to respond_to(:get_ship_weight_integer)
    end

    it 'should return correct result' do
      expect(ArgsParser.get_ship_weight_integer('28801, [[:land, 9.807]]')).to eq 28801
    end

    describe 'incorrect arguments raise error' do
      it do
        expect { ArgsParser.get_ship_weight_integer(', [[:land, 9.807]]') }.to raise_error
      end

      it do
        expect { ArgsParser.get_ship_weight_integer('[[:land, 9.807]]') }.to raise_error
      end

      it do
        expect { ArgsParser.get_ship_weight_integer('bla') }.to raise_error
      end
    end
  end

  describe 'method calculate_whole_way_fuel parse route args from string' do
    it 'should respond to get_flight_route_array' do
      expect(ArgsParser).to respond_to(:get_flight_route_array)
    end

    it 'without a first argument' do
      expect(ArgsParser.get_flight_route_array('[[:land, 9.807]]')).to eq [[:land, 9.807]]
    end

    it 'with many arguments' do
      expect(ArgsParser.get_flight_route_array('1, 2, 3, [:land, 9.807]')).to eq [[:land, 9.807]]
    end

    it 'should pass only :launch or :land' do
      expect { ArgsParser.get_flight_route_array('28801, [[:bla, 9.807]]') }.to raise_error
      expect(ArgsParser.get_flight_route_array('28801, [[:launch, 9.807]]')).to eq [[:launch, 9.807]]
      expect(ArgsParser.get_flight_route_array('28801, [[:land, 9.807]]')).to eq [[:land, 9.807]]
    end

    describe 'correct args' do
      it 'simple route' do
        expect(ArgsParser.get_flight_route_array('28801, [[:land, 9.807]]')).to eq [[:land, 9.807]]
      end

      it 'long route' do
        expect(ArgsParser.get_flight_route_array('28801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]'))
          .to eq [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]
      end
    end
  end
end
