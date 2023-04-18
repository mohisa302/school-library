require 'json'
persons = JSON.parse(File.read('localstorage/person.json'))
persons.each do |student|
  # Output the student's name and age
  student_str = JSON.generate(student).gsub(/[{}"=><]/, '').gsub(/([A-Za-z_]+)(\d+)/, '\1:\2').gsub(/,(\S)/, ', \1')
  p student_str.name
  puts student_str
end
