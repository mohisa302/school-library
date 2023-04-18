require './book'
require './student'
require './teacher'
require './person'
require 'date'
require './rental'

class App
  def initialize(library)
    @library = library
  end

  def list_books
    @library.books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @library.people.each do |person|
      # p person
      if person.is_a?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'do you want to create a student (1) or a teacher (2)? [Inpust the number]: '
    person_type = gets.chomp
    if person_type == '1'
      create_student
    elsif person_type == '2'
      create_teacher
    else
      puts 'Invalid input! Please try again.'
    end
  end

  def create_student
    print "Enter student's age: "
    age = gets.chomp.to_i
    print "Enter student's name: "
    name = gets.chomp
    print 'Does the student have parent permission? [Y/N] '
    parent_permission = gets.chomp.downcase == 'y'
    # Create student object using input values
    student = Student.new('Unknown', age, name, parent_permission: parent_permission)
    @library.add_person(student)
    puts 'Student created successfully!'
  end

  def create_teacher
    print "Enter teacher's age: "
    age = gets.chomp.to_i
    print "Enter teacher's name: "
    name = gets.chomp
    print "Enter teacher's specialization: "
    specialization = gets.chomp
    # Create teacher object using input values
    teacher = Teacher.new(specialization, age, name)
    @library.add_person(teacher)
    puts 'Teacher created successfully!'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    auther = gets.chomp
    book = Book.new(title, auther)
    @library.add_book(book)
    puts 'Book created successfully!'
  end

  def create_rental
    selected_book = create_selected_book
    return if selected_book.nil?

    selected_person = create_selected_person
    return if selected_person.nil?

    print 'Date(format: YYYY/MM/DD): '
    date_str = gets.chomp
    date = Date.parse(date_str)
    rental = Rental.new(selected_book, selected_person, date)
    @library.add_rental(rental)
    puts 'Rental created successfully!'
  end

  def create_selected_book
    puts 'Select a book from the following list by number'
    @counter = 0
    book_numbers = {}
    @library.books.each do |book|
      puts "#{@counter}) Title: \"#{book.title}\", Author: #{book.author}"
      book_numbers[@counter] = book
      @counter += 1
    end
    book_number = gets.chomp.to_i
    book_numbers[book_number]
  end

  def create_selected_person
    puts 'Select a person from the following list by number(not id)'
    @counter = 0
    person_numbers = {}

    @library.people.each do |person|
      if person.is_a?(Student)
        puts "#{@counter}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "#{@counter}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      person_numbers[@counter] = person
      @counter += 1
    end
    person_number = gets.chomp.to_i
    person_numbers[person_number]
  end

  def list_rentals_for_person
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    @library.rentals.each do |rental|
      puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
    end
  end
end
