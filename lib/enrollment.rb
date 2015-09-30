class Enrollment

  def initialize(enrollment_data)
    @enrollment_data = enrollment_data
  end

  def participation_in_year(year)
    result = @enrollment_data.fetch("participation_by_year")
    result.fetch(year.to_s)
  end

end
