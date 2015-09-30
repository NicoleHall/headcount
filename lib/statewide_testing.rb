require 'district'
require 'district_repository'

class StatewideTesting
  attr_accessor :data

  def initialize(statewide_testing_data)
    @statewide_testing_data = statewide_testing_data
  end

  def proficient_for_subject_by_grade_in_year(subject, grade, year)
    results = @statewide_testing_data.fetch("by_subject_year_and_grade")
    result = results.find do |syag|
      syag.fetch("subject") == subject.to_s &&
      syag.fetch("grade")   == grade        &&
      syag.fetch("year")    == year
    end
    result.fetch("proficiency")
  end

end
