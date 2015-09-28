#these are the things that are going into enrollment
# DROP OUT RATES BY RACE/ETHNICITY
#HIGH SCHOOL GRADUATION RATE
#KINDERGARTENERS IN FULL DAY PROGRAM
#ONLINE PUPIL ENROLLMENT
#PUPIL ENROLLMENT BY RACE AND ETHNICITY
DAT YUNG PUPIL ENROLLMENT
#SPECIAL EDUCATION
#REMEDIATION AND HIGHER ENDUCATION

require_relative 'CsvReader'
require_relative 'district'
require_relative 'district_repository'

class Enrollment

  def initialize
  end

  def load_pupil_enrollment
    info = CsvReader.new
    info.load_pupil_enrollment
  end

end
