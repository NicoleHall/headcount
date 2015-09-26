$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))

require 'minitest/autorun'
require 'minitest/emoji'
require 'district_repository'
require 'pry'


class TestEconomicProfile < Minitest::Test
  def test_free_or_reduced_lunch_by_year
    repository = district_repository
    expected_data = {2014=>0.127, 2012=>0.125, 2011=>0.12, 2010=>0.113, 2009=>0.103, 2013=>0.132, 2008=>0.094, 2007=>0.08, 2006=>0.072, 2005=>0.059, 2004=>0.06, 2003=>0.06, 2002=>0.048, 2001=>0.047, 2000=>0.04}
    assert_equal expected_data, repository.find_by_name("ACADEMY 20").economic_profile.free_or_reduced_lunch_by_year
  end

  def test_free_or_reduced_lunch_in_year
    repository = district_repository
    district   = repository.find_by_name("ACADEMY 20")
    assert_equal 0.125, district.economic_profile.free_or_reduced_lunch_in_year(2012)
    assert_equal 0.127, district.economic_profile.free_or_reduced_lunch_in_year(2014)
  end

  private

  def district_repository
    path = File.expand_path("../data", __dir__)
    repository = DistrictRepository.new(path)
  end
end
