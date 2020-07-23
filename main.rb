require_relative 'fuel_calculation'
require_relative 'args_parser'

args = ARGV.join()

ship_weight = ArgsParser.get_ship_weight_integer(args)
flight_route = ArgsParser.get_flight_route_array(args)

puts FuelCalculation.report_fuel_weight(ship_weight, flight_route)
