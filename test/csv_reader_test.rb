$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))

require 'minitest/autorun'
require 'minitest/emoji'
require 'csv_reader'

FAKE_CSV_DATA = <<-CSV
Location,Data
Foo,1
Bar,2
CSV

class CsvReaderTest < Minitest::Test
  def test_determining_if_a_location_with_a_name_exists
    csv_reader = CsvReader.new(FAKE_CSV_DATA)
    assert csv_reader.location_exists?("Foo")
    assert csv_reader.location_exists?("Bar")
    refute csv_reader.location_exists?("Baz")
  end
end
