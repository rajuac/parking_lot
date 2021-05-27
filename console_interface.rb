require './helper_module'

class ConsoleInterface
  include HelperModule

  def start_application
    while true
      generate_console_menu
      print 'Enter the option: '
      user_input = gets.chomp
      case user_input.to_i
      when 1
        list_parking_spots
      when 2
        park_vehicle
      when 3
        unpark_vehicle
      when 4
        find_vehicle
      end
    end
  end

  def generate_console_menu
    puts "\nWelcome to Parking Management System.\n"
    puts "\t1.  List available parking spots"
    puts "\t2.  Park Vehicle"
    puts "\t3.  Unpark Vehicle"
    puts "\t4.  Find Vehicle"
  end
end

obj = ConsoleInterface.new
obj.start_application
