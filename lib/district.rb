require "economic_profile"

class District
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def economic_profile
    EconomicProfile.new
  end
end
