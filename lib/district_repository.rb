require 'pry'
require 'CSV'

class DistrictRepository

   def from_csv(path)
    contents = CSV.foreach("../headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol)
    districts = contents.map {|row| row.to_h}
    find_by_district_name = districts.group_by do |district|
      district.fetch(:location)
    end
    find_by_district_name
   end

   def initialize(path)#i want it to have all the data available)
    @repository = from_csv(path)
   end

    # binding.pry
  #  districts#this will return a new dist repository instance(just the word new)

  def find_by_name(district_name)
    district = @repository.select do |district|
        district == district_name
    end
    binding.pry
    District.new(district)
  end
end

class EconomicProfile
attr_reader

  def initialize(district_name)
    @economic_data = district_name
  end

  # def from_csv(path)
  #   contents = (CSV.open "../headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol)
  #   district = contents.map do |rows|
  #     [rows.fetch(:data)].to_h
  #     [rows.fetch(:dataformat)].to_h
  #     [rows.fetch(:timeframe)]{}]}.to_h
  # end

  def free_or_reduced_lunch_in_year(year)
    # 0.125
    #  binding.pry
  end

end

class District
attr_reader :district_data

 def initialize(district_data)
    binding.pry
    @district_data = district_data
  end

  def name
  end

  def state_wide_testing
  end

  def enrollment
  end

  def economic_profile
  EconomicProfile.new(district_data)
  end

end
