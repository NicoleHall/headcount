require "error"

class Enrollment
  def initialize(enrollment_data)
    @enrollment_data = enrollment_data
  end

  def participation_in_year(year)
    result = @enrollment_data.fetch("participation_by_year")
    result.fetch(year.to_s)
  end

  def dropout_rate_in_year(year)
    rates = @enrollment_data.fetch("dropout_rates")
    results = rate
  end

  def dropout_rate_for_race_or_ethnicity_in_year(race, year)
    raise UnknownRaceError unless [:asian, :black, :pacific_islander, :hispanic, :native_american, :two_or_more, :white].include?(race)
    rates = @enrollment_data.fetch("dropout_rates").select do |hash|
      hash["year"] == year
    end
    rates.detect { |hash| hash["category"].to_sym  == race }.fetch("rate")
  end
end
