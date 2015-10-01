require 'error'
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

  def proficient_by_grade(grade)
    raise UnknownDataError unless grade == 3 || grade == 8
    results = @statewide_testing_data.fetch("by_subject_year_and_grade")

    filtered_by_grade = results.select do |row|
      row if row["grade"] == grade
    end
    years = {}
    filtered_by_grade.map do |row|
      years[row['year']] = {}
    end

    years.each_pair do |year, hash|
      filtered_by_grade.each do |row|
        if row["year"] == year
          hash[row["subject"].to_sym] = row["proficiency"]
        end
      end
    end
    years
  end

  def proficient_by_race_or_ethnicity(race)
    hash = @statewide_testing_data.fetch("by_subject_year_and_race")
    filtered_by_race = hash.select { |hash| hash['race'].to_sym == race}
    filtered = filtered_by_race.group_by { |e| e["year"] }
    filtered.each do |year, data| n = {}; data.each do |d| n[d["subject"]] = d["proficiency"] end; hash[year] = n
    end

    require 'pry'; binding.pry
  end








 #  def proficient_by_race_or_ethnicity(race)
 #    results = @statewide_testing_data.fetch("by_subject_year_and_race")
 #    years = {}
 #    results.map do |row|
 #      years[row['race']] = row['proficiency']
 #    end
 #     years.each_pair do |year, hash|
 #       results.each do |row|
 #         if row["year"] == year
 #           hash[row["subject"].to_sym] = row["proficiency"]
 #         end
 #     end
 #    end
 #    years
 #    require 'pry'; binding.pry
 #  end
  end
