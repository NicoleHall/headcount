$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))

require 'minitest/autorun'
require 'minitest/emoji'
require 'csv_reader'

FAKE_CSV_DATA = <<-CSV
Location,Data
Foo,1
Bar,2
Foo,3
CSV

class CsvReaderTest < Minitest::Test
  def test_determining_if_a_location_with_a_name_exists
    csv_reader = CsvReader.new(FAKE_CSV_DATA)
    bar_rows = [{ "Location" => "Bar", "Data" => "2" }]
    foo_rows = [
      { "Location" => "Foo", "Data" => "1" },
      { "Location" => "Foo", "Data" => "3" },
    ]
    assert_equal bar_rows, csv_reader.rows_for_location("Bar")
    assert_equal foo_rows, csv_reader.rows_for_location("Foo")
    assert_nil csv_reader.rows_for_location("Baz")
  end

  def test_location_exists_is_case_insensitive
    csv_reader = CsvReader.new(FAKE_CSV_DATA)
    refute_nil csv_reader.rows_for_location("FOO")
    refute_nil csv_reader.rows_for_location("foo")
  end
end
