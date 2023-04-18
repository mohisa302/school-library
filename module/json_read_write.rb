require 'json'
module JsonReadWrite
  def json_write(file_name ,json_data)
    existing_data = []
    if File.exist?(file_name) && !File.zero?(file_name)
      existing_data = JSON.parse(File.read(file_name))
    end

    existing_data << json_data
    File.open(file_name, "w") do |f|
      f.write(JSON.pretty_generate(existing_data))
    end
  end
  def json_read(file_name)
    existing_data = []
    if File.exist?(file_name) && !File.zero?(file_name)
      existing_data = JSON.parse(File.read(file_name))
    end
    existing_data
  end
end
