$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))

require 'minitest/autorun'
require 'minitest/emoji'
require 'district_repository'
require 'pry'


class TestEconomicProfile < Minitest::Test
  def test_free_or_reduced_lunch_in_year
    path = File.expand_path("../data", __dir__)
    repository = DistrictRepository.new(path)
    district   = repository.find_by_name("ACADEMY 20")
    assert_equal 0.125, district.economic_profile.free_or_reduced_lunch_in_year(2012)
    assert_equal 0.127, district.economic_profile.free_or_reduced_lunch_in_year(2014)
  end
end
