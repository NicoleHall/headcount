require 'pry'
require 'CSV'

class DistrictRepository

  # def initialize(#i want it to have all the data available)
  #
  # end

  def self.from_csv(path)
    fullpath = File.join(path, "Students qualifying for free or reduced price lunch.csv")
    rows = CSV.read(fullpath, headers: true, header_converters: :symbol)
    binding.pry


    # rows.each do |row|

    #this will return a new dist repository instance(just the word new)
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

    def name
    end

    def state_wide_testing
    end

    def enrollment
    end

  def economic_profile
    EconomicProfile.new
  end

end
