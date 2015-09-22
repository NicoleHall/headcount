require 'minitest/autorun'
require 'minitest/pride'
require './lib/district_repository'


class TestEconomicProfile < Minitest::Test
  def test_free_or_reduced_lunch_in_year
    path = File.expand_path("../data", __dir__)
    repository = DistrictRepository.from_csv(path)
    #is a method I write that loads all of my files
    #and it will live in my DistrictRepository class
    district   = repository.find_by_name("ACADEMY 20")

    assert_equal 0.125, district.economic_profile.free_or_reduced_lunch_in_year(2012)
  end
end

class TestDistric < Minitest::Test

  def test_it_has_a_class
    assert District
  end

end