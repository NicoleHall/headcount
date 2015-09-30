require 'json'
require "district"
class DistrictRepository
  def self.from_json(filename)
    data = JSON.parse(File.read(filename))
    DistrictRepository.new(data)
  end
  attr_reader :filename, :from_json

  def initialize(districts_data)
    @collection = {}
    districts_data.each do |k, v|
      @collection[k.upcase]=District.new(v)
    end
  end

  def find_by_name(name)
    @collection[name.upcase]
  end

  def find_all_matching(name_fragment)
    result = @collection.select do |name, district|
      name.include?(name_fragment.upcase)
    end
    result.values
  end


end
