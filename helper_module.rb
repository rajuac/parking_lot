# frozen_string_literal: true

require './parking_record'
require './parking_spot'

module HelperModule
  def list_parking_spots
    spots = parking_spot.get_available_spots
    if spots.empty?
      print "\nNo parking spots available\n"
    else
      spots.each_with_index do |spot, i|
        print "\n\n#{i + 1}) #{spot.options[:spot_id]}-#{spot.options[:type]}\n"
      end
    end
  end

  def park_vehicle
    print "\n Parking Spot ID: "
    spot_id = gets.chomp
    spot = parking_spot.get_spot(spot_id)
    if spot.nil?
      puts "\nNo spot found by this ID\n"
    else
      print "\n Vehicle Number: "
      number = gets.chomp
      parking_record.park_vehicle({ spot_id: spot_id, v_no: number })
      print "\nvehicle  #{number} parked on  #{spot_id}\n\n "
    end
  end

  def unpark_vehicle
    print "\n Vehicle Number: "
    number = gets.chomp
    record = parking_record.get_parked_record(number)
    if record.nil?
      puts "No vehcile found by this number\n"
    else
      record.unpark({ v_no: number })
      print "\nvehicle  #{number} unparked\n\n"
    end
  end

  def find_vehicle
    print "\n Vehicle Number: "
    number = gets.chomp
    record = parking_record.get_parked_record(number)
    if record.nil?
      puts "\n\nNo vehcile parked by this number"
    else
      print "\n vehicle  #{number} is  parked on slot #{record.options[:spot_id]}\n\n"
    end
  end

  def parking_record
    ParkingRecord.new
  end

  def parking_spot
    ParkingSpot.new
  end
end
