require "economic_profile"

class District
  attr_reader :name, :economic_profile

  def initialize(name, economic_profile)
    @name = name
    @economic_profile = economic_profile
  end
end
