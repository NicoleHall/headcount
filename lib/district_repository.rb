require 'pry'
require 'CSV'

class DistrictRepository

  def from_csv(path)
    # file = "Students qualifying for free or reduced price lunch.csv"
    # fullpath = File.join(path, file)
    # contents = (CSV.open "../headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol)
    # district = []
    # contents.each do |row|
    #   district << row.to_a
    #   end
    #   district
    contents = CSV.foreach("../headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol)
    contents.map {|row| row.to_h}
    # district = contents.map { |rows| [rows.fetch(:location).upcase, {}]}.to_h
    #maybe not have all the stuffs come in?

   end

   def initialize(path)#i want it to have all the data available)
    @districts = from_csv(path)
   end

    # binding.pry
  #  districts#this will return a new dist repository instance(just the word new)

  def find_by_name(district_name)
    @districts.detect do |district|
        district == district_name
    end
    District.new(district_name)
  end
end

class EconomicProfile
attr_reader

  def initialize(district_name)
    @name = district_name
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
attr_reader :name
            :location

 def initialize(name)
    @name = name
  end

  def name
  end

  def state_wide_testing
  end

  def enrollment
  end

  def economic_profile
  EconomicProfile.new(@name)
  end

end
