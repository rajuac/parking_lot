class ParkingRecord
  @@parking_records = []
  @@errors = []

  attr_accessor :options

  def initialize(options = {})
    @options = options
    @@errors = []
  end

  def park_vehicle(p_record)
    validate(p_record)
    puts @@errors
    @@parking_records << ParkingRecord.new(p_record)
    park_slot = ParkingSpot.new.get_spot(p_record[:spot_id])
    park_slot.options[:status] = 'Parked'
  end

  def unpark(p_record)
    u_record = get_parked_record(p_record[:v_no])
    park_slot = ParkingSpot.new.get_spot(u_record.options[:spot_id])
    park_slot.options[:status] = 'Available'
    delete_parking_record(u_record)
  end

  def delete_parking_record(u_record)
    index = @@parking_records.index(u_record)
    @@parking_records[index] = nil
  end

  def find_vehicle(v_no)
    get_parked_record(v_no)
  end

  def get_parked_record(v_no)
    get_all_records.find { |reco| reco.options[:v_no] == v_no }
  end

  def get_all_records
    @@parking_records
  end

  private

  def validate(p_record)
    @@errors << "\n vehicle number can't be blank" if p_record[:v_no].empty?
  end
end
