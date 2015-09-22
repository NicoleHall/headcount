require 'csv'

puts "File IO initialized."

class FileIO
  def initialize
    @repository = {}
    
  end

def self.from_csv(path)
  #opens the csv in folder
  path = File.expand_path("../data", __dir__)
  filename = "3rd Grade Students Scoring Proficient or Above on the CSAP/TCAP"
  fullpath = File.join(path, filename)
  @repository = {}
  rows = CSV.read(fullpath, headers: true, header_converters: :symbol)
  rows.each do |row|
    puts row
  end
end

end

FileIO.from_csv(path)
