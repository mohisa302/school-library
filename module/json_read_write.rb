require 'json'
require_relative '../library'

class TempRental
  attr_accessor :name, :age, :id

  def initialize(name, age, id)
    @name = name
    @age = age
    @id = id
  end
end

module JsonReadWrite
  def json_write(file_name, json_data)
    existing_data = []
    existing_data = JSON.parse(File.read(file_name)) if File.exist?(file_name) && !File.empty?(file_name)

    existing_data << json_data
    File.write(file_name, JSON.pretty_generate(existing_data))
  end

  def json_read(file_name)
    case file_name
    when 'localstorage/book.json'
      read_books(file_name)
    when 'localstorage/person.json'
      read_people(file_name)
    when 'localstorage/rental.json'
      read_rentals(file_name)
    else
      []
    end
  end

  private

  def read_books(file_name)
    books = []
    temp = JSON.parse(File.read(file_name))
    temp.each do |book|
      books << Book.new(book['title'], book['author'])
    end
    books
  end

  def read_people(file_name)
    people = []
    temp = JSON.parse(File.read(file_name))
    temp.each do |person|
      people << if person['type'] == 'Student'
                  Student.new(person['classroom'], person['age'], person['name'],
                              parent_permission: person['parent_permission'])
                else
                  Teacher.new(person['specialization'], person['age'], person['name'])
                end
    end
    people
  end

  def read_rentals(file_name)
    rentals = []
    begin
      temp = File.read(file_name)
      temp = JSON.parse(temp)
      temp.each do |rental|
        book = Book.new(rental['book']['title'], rental['book']['author'])
        person = TempRental.new(rental['name'], rental['age'], rental['id'])
        date = rental['date']
        rentals << Rental.new(book, person, date)
      end
    rescue JSON::ParserError => e
      puts "Failed to parse JSON data: #{e.message}"
    rescue StandardError => e
      puts "An error occurred while reading rentals: #{e.message}"
    end
    rentals
  end
end
