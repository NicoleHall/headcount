require 'csv'

class CsvReader
  def initialize(data)
    @data = CSV.new(data, headers: true).to_a
  end

  def rows_for_location(location_name)
    row = data.select do |row|
      row["Location"].upcase == location_name.upcase
    end

    if row.any?
      row.map(&:to_h)
    end
  end

  protected

  attr_reader :data
end
