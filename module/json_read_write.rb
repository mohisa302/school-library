require 'json'

class TempBook
  attr_accessor :title, :author
  def initialize(title, author)
    @title = title
    @author = author
  end
end

class TempRental
  attr_accessor  :name, :age, :id
  def initialize( name, age, id)
    @name = name
    @age = age
    @id = id
  end
end

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
      if(file_name == 'localstorage/book.json')
         temp = JSON.parse(File.read(file_name))
          temp.each do |book|
            existing_data << Book.new(book['title'], book['author'])
          end
      end
      if(file_name=='localstorage/person.json')
        temp = JSON.parse(File.read(file_name))
        temp.each do |person|
          if person['type'] == 'Student'
            existing_data << Student.new(person['classroom'], person['age'], person['name'], parent_permission: person['parent_permission'])
          else
            existing_data << Teacher.new(person['specialization'], person['age'], person['name'])
          end
        end
      end
      if(file_name=='localstorage/rental.json')
        temp = JSON.parse(File.read(file_name))

        temp.each do |rental|
          TempBook.new(rental['title'],rental['author'])
           existing_data << Rental.new(
            TempBook.new(rental['title'],rental['author']),
            TempRental.new(rental['name'],rental['age'],rental['id']) ,rental['date'] )
        end
      end
    end
  existing_data
  end
end
