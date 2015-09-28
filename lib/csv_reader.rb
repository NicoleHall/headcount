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

  def load_pupil_enrollment
    rows = CSV.read('/Users/FatMac/turing/module_one_take_two/projects/headcount/data/Pupil enrollment.csv', headers: true, header_converters: :symbol).map(&:to_h)
    require 'pry'; binding.pry
  end

  private

  def data
    @array_data ||= @data.to_a
  end
end
