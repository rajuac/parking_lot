class ParkingSpot
  @@parking_spots = []
  @@errors = []

  attr_accessor :options

  def initialize(options = {})
    @options = options
    @@errors = []
  end

  def add_new_spot(spot)
    @@parking_spots << ParkingSpot.new(spot)
  end

  def get_all_spots
    @@parking_spots
  end

  def get_available_spots
    @@parking_spots.find_all { |spot| spot.options[:status] == 'Available' }
  end

  def get_spot(spot_id)
    get_all_spots.find { |spot| spot.options[:spot_id] == spot_id }
  end
end
[{ spot_id: '100A', status: 'Available' },
 { spot_id: '101A', status: 'Available' },
 { spot_id: '102A', status: 'Available' },
 { spot_id: '103A', status: 'Available' },
 { spot_id: '104A', status: 'Available' },
 { spot_id: '105A', status: 'Available' }].each do |a|
  ParkingSpot.new.add_new_spot(a)
end
