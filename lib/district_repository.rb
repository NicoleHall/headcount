require 'pry'
require 'CSV'

class DistrictRepository

   def initialize(path)#i want it to have all the data available)
    @districts = from_csv(path)
   end

  def from_csv(path)
    fullpath = File.join(path, "Students qualifying for free or reduced price lunch.csv")
    contents = CSV.open fullpath, headers: true, header_converters: :symbol
    districts = []
    contents.each do |row|
      districts << District.new(row)
      # district_name = row[:location]
      # binding.pry

    end
   districts#this will return a new dist repository instance(just the word new)
  end

  def find_by_name(district_name)
    @districts.detect do |district|
        district.location == district_name
    end
    #we want to itterate through this array
    #upon itterating through the array depending on what
    #is passed through is what we will shovel into a
    #new array
  end
end

class EconomicProfile
  attr_reader :timeframe,
              :data

  def initialize
    @timeframe = attributes[:timeframe]
    @data = attributes[:data]

    def free_or_reduced_lunch_in_year(year)
      @districts.detect do |district|
        district.timeframe == year
        end
    end


end

class District
attr_reader :location,
            :timeframe,
            :data,
            :poverty_level

  def initialize(attributes)
    @location  = attributes[:location]
    @timeframe = attributes[:timeframe]
    @data      = attributes[:data]
    @poverty   = attributes[:poverty_level]
      #do this for the rest of the attributes for a disrict
  end

  def name
  end

  def state_wide_testing
  end

  def enrollment
  end

  def economic_profile
     if @poverty == "Eligible for Free or Reduced Lunch"

     end
  end




end
