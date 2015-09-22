class DistrictRepository

  # def initialize(#i want it to have all the data available)
  #
  # end

  def self.from_csv(path)
    new #this will return a new dist repository instance(just the word new)
  end

  def find_by_name(district_name)
    District.new
  end
end

class EconomicProfile
  def free_or_reduced_lunch_in_year(year)
    0.125
  end
end

class District

  def economic_profile
    EconomicProfile.new
  end

end
