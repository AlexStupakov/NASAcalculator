module FuelCalculation

	# example:
	# FuelCalculation.calculate_whole_way_fuel(28801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]])
	# on the end point will finish ship without fuel,
	# so the method calculates fuel from the end of trip to start
	def self.calculate_whole_way_fuel(ship_weight, flight_route)
		ship_and_fuel_weight =
			flight_route.reverse.inject(ship_weight) do |total_weight, local_action|
				action_type = local_action[0]
				gravity = local_action[1]
				total_weight + self.calculate_one_action_fuel(total_weight, gravity, action_type)
			end
		whole_way_fuel_weight = ship_and_fuel_weight - ship_weight
		whole_way_fuel_weight
	end

	# recursive method, calculates fuel weight for launch or land
	# For example, for Apollo 11 Command and Service Module, with weight of 28801 kg, to
	# land it on the Earth, required amount of fuel will be:
	# 28801 * 9.807 * 0.033 - 42 = 9278
	# But fuel adds weight to the ship, so it requires additional fuel, until additional fuel is 0 or
	# negative.
	# 9278 fuel requires 2960 more fuel
	# 2960 fuel requires 915 more fuel
	# 915 fuel requires 254 more fuel
	# 254 fuel requires 40 more fuel
	# 40 fuel requires no more fuel
	# So, to land Apollo 11 CSM on the Earth - 13447 fuel required (9278 + 2960 + 915 + 254	+ 40)
	def self.calculate_one_action_fuel(mass, gravity, action_type, total_mass = 0)
		fuel = case action_type
		when :launch
			(mass * gravity * 0.042 - 33).to_i
		when :land
			(mass * gravity * 0.033 - 42).to_i
		end
		return total_mass if fuel <= 0
		self.calculate_one_action_fuel(fuel, gravity, action_type, total_mass + fuel)
	end

	def self.report_fuel_weight(ship_weight, flight_route)
		fuel_weight = calculate_whole_way_fuel(ship_weight, flight_route)

		"Space ship with weight #{ship_weight}, that going to trip #{flight_route}, should have #{fuel_weight} of fuel."
	end
end
