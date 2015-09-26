class EconomicProfile
  def initialize(data)
    @data = data
  end

  def free_or_reduced_lunch_by_year
    matching_rows = data.select do |row|
      row_is_free_or_reduced_lunch?(row) &&
        row_is_percent?(row)
    end

    matching_rows.map do |row|
      [row["TimeFrame"].to_i, row["Data"].to_f.round(3)]
    end.to_h
  end

  def free_or_reduced_lunch_in_year(year)
    free_or_reduced_lunch_by_year[year]
  end

  protected

  attr_reader :data

  private

  def row_is_free_or_reduced_lunch?(row)
    row["Poverty Level"] == "Eligible for Free or Reduced Lunch"
  end

  def row_is_percent?(row)
    row["DataFormat"] == "Percent"
  end
end
