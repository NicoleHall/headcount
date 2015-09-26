$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))

require 'minitest/autorun'
require 'minitest/emoji'
require 'district_repository'

class DistrictRespositoryTest < Minitest::Test
  def test_find_by_name_returns_a_district_with_that_name
    assert_equal "ACADEMY 20", district_repository.find_by_name("ACADEMY 20").name
    assert_equal "ADAMS COUNTY", district_repository.find_by_name("ADAMS COUNTY").name
  end

  def test_find_by_name_returns_nil_for_a_nonexistent_name
    skip "We're going deeper!"
    assert_nil district_repository.find_by_name("wibble")
  end

  def test_find_by_name_performs_a_case_insensitive_search
  end

  private

  def district_repository
    path = File.expand_path("../data", __dir__)
    repository = DistrictRepository.new(path)
  end
end
