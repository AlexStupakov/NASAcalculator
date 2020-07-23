module ArgsParser

  # parses args for ship weight
  # args example: '28801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]'
  def self.get_ship_weight_integer(args)
  	result = args.slice(/^\d+/).to_i
    raise_incorrect_argument_error if result < 1
    result
  end

  # parses args for flight route
  # args example: '28801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]'
  def self.get_flight_route_array(args)
  	result = args.scan(/:launch, \d{1,}\.\d{1,}|:land, \d{1,}\.\d{1,}/)
  		           .map{ |e| [ e.slice(/\w+/).to_sym, e.slice(/[\d\.]+/).to_f ] }
    raise_incorrect_argument_error if result.empty?
    result
  end

  def self.raise_incorrect_argument_error
    raise ArgumentError, "Please use correct arguments, \nExample: \"28801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]\""
  end

end
