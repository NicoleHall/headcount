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
    bar_row = { "Location" => "Bar", "Data" => "2" }
    foo_row = { "Location" => "Foo", "Data" => "1" }
    assert_equal bar_row, csv_reader.row_for_location("Bar")
    assert_equal foo_row, csv_reader.row_for_location("Foo")
    assert_nil csv_reader.row_for_location("Baz")
  end

  def test_location_exists_is_case_insensitive
    csv_reader = CsvReader.new(FAKE_CSV_DATA)
    foo_row = { "Location" => "Foo", "Data" => "1" }
    assert_equal foo_row, csv_reader.row_for_location("FOO")
    assert_equal foo_row, csv_reader.row_for_location("foo")
  end
end
