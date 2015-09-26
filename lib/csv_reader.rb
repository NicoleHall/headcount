require 'csv'

class CsvReader
  def initialize(data)
    @data = CSV.new(data, headers: true)
  end

  def location_exists?(location_name)
    data.any? do |row|
      row["Location"] == location_name
    end
  end

  protected

  attr_reader :data
end
