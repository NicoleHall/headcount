require "enrollment"
require "economic_profile"
require "district_repository"
require "statewide_testing"
class District
  attr_reader :name, :economic_profile

  # initialize it with a hash of all the stuff it needs to be a district enrollment, name, sw testing, economic_profile
  #
  def initialize(district_data)
    @district_data = district_data
  end

  def name
    @district_data.fetch("name")
  end

  def statewide_testing
    statewide_testing_data = @district_data.fetch("statewide_testing")
    StatewideTesting.new(statewide_testing_data)
  end

  def enrollment
    enrollment_data = @district_data.fetch("enrollment")
    Enrollment.new(enrollment_data)
  end

  def economic_profile
  end

end
