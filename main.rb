require_relative 'fuel_calculation'
require_relative 'args_parser'

args = ARGV.join()
ship_weight = ArgsParser.get_ship_weight_integer(args)
flight_route = ArgsParser.get_flight_route_array(args)

if ship_weight < 1 || flight_route.empty?
  puts "please use correct arguments,"
  puts 'example: "28801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]"'
  exit
end

fuel_weight = FuelCalculation.calculate_whole_way_fuel(ship_weight, flight_route)

puts "Space ship with weight #{ship_weight}, that going to trip #{flight_route}, should have #{fuel_weight} of fuel."
