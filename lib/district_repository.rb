require "district"
require "csv_reader"

class DistrictRepository
  def initialize(path)
    data_file = File.open(File.join(path, "Students qualifying for free or reduced price lunch.csv"))
    @csv_reader = CsvReader.new(data_file)
  end

  def find_by_name(name)
    data = csv_reader.rows_for_location(name)
    if data
      District.new(name.upcase)
    end
  end

  protected

  attr_reader :csv_reader
end
