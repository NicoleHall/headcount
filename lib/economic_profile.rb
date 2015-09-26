class EconomicProfile
  def initialize(data)
    @data = data
  end

  def free_or_reduced_lunch_in_year(year)
    matching_row = data.find do |row|
      row_is_for_year?(row, year) &&
        row_is_free_or_reduced_lunch?(row) &&
        row_is_percent?(row)
    end

    matching_row["Data"].to_f.round(3)
  end

  protected

  attr_reader :data

  private

  def row_is_for_year?(row, year)
    row["TimeFrame"] == year.to_s
  end

  def row_is_free_or_reduced_lunch?(row)
    row["Poverty Level"] == "Eligible for Free or Reduced Lunch"
  end

  def row_is_percent?(row)
    row["DataFormat"] == "Percent"
  end
end
