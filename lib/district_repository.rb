require 'pry'
require 'CSV'

class DistrictRepository

  def from_csv(path)
    # file = "Students qualifying for free or reduced price lunch.csv"
    # fullpath = File.join(path, file)
    contents = (CSV.open "../headcount/data/Students qualifying for free or reduced price lunch.csv", headers: true, header_converters: :symbol)
    district = contents.map { |rows| [rows.fetch(:location).upcase, {}]}.to_h
    # a hash of {"name" => <District.news>}
      # iterate through all out rows
      # grab only name/ (row[:location])
        # grab only unique names/ skip rows where we already have row[:location]
      # add them to new hash as key - assign value of new insatance
      binding.pry
    end


   def initialize(path)#i want it to have all the data available)
    @districts = from_csv(path)
   end

    # binding.pry
  #  districts#this will return a new dist repository instance(just the word new)
  end

#   def find_by_name(district_name)
#     @districts.detect do |district|
#         district.name == district_name
#     end
#     District.new(district_name)
#   end
# end
#
# class EconomicProfile
# attr_reader
#
#   def free_or_reduced_lunch_in_year(year)
#     file = "Students qualifying for free or reduced price lunch.csv"
#     fullpath = File.join(path, file)
#     contents = CSV.open fullpath, headers: true, header_converters: :symbol
#     contents.map do |row|
#       row.to_h
#     end
#   end
# end
#
# class District
# attr_reader :name
#             :location
#
#  def initialize(name)
#     @name          = name
#   end
#
#   def name
#   end
#
#   def state_wide_testing
#   end
#
#   def enrollment
#   end
#
#   def economic_profile
#   EconomicProfile.new(@name)
#   end
#
# end
