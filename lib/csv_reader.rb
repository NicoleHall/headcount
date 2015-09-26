require 'csv'

class CsvReader
  def initialize(data)
    @data = CSV.new(data, headers: true)
  end

  def rows_for_location(location_name)
    row = data.select do |row|
      row["Location"].upcase == location_name.upcase
    end

    if row.any?
      row.map(&:to_h)
    end
  end

  private

  def data
    @array_data ||= @data.to_a
  end
end
