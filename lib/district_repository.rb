require "district"
require "csv_reader"

class DistrictRepository
  def initialize(path)
    @data_path = path
    @free_lunch_data = read_data_from_file("Students qualifying for free or reduced price lunch.csv")
    @household_income_data = read_data_from_file("Median household income.csv")
  end

  def find_by_name(name)
    if district_exists?(name)
      economic_profile = EconomicProfile.new(
        free_lunch_data_for_district(name),
        household_income_data_for_district(name),
      )
      District.new(name.upcase, economic_profile)
    end
  end

  protected

  attr_reader :data_path, :free_lunch_data, :household_income_data

  private

  def district_exists?(name)
    !free_lunch_data_for_district(name).nil?
  end

  def read_data_from_file(file_name)
    file_path = File.join(data_path, file_name)
    data_file = File.open(file_path)
    CsvReader.new(data_file)
  end

  def free_lunch_data_for_district(name)
    free_lunch_data.rows_for_location(name)
  end

  def household_income_data_for_district(name)
    household_income_data.rows_for_location(name)
  end
end
