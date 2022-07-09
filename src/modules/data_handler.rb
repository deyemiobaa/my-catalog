require 'fileutils'
require 'json'

# Handle save and write methods for JSON data manipulation
module DataHandler
  def self.save_data(file_name, data)
    FileUtils.mkdir_p './json' unless File.directory?('./json')
    File.write("./json/#{file_name}.json", JSON.pretty_generate(data), mode: 'w')
  end

  def self.read_data(file_name)
    if File.exist?("./json/#{file_name}.json") && !File.zero?("./json/#{file_name}.json")
      JSON.parse(File.read("./json/#{file_name}.json"))
    else
      []
    end
  end
end
