#!/usr/bin/env ruby to the first line of file

require_relative './app'
require_relative './library'

def show_menu
  puts "\nPlease choose an option by entering a number:"
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def main(library)
  app = App.new(library)
  puts 'Hello here! welcome to School Library App!'
  puts ''
  loop do
    show_menu

    choice = gets.chomp.downcase

    case choice
    when '1'
      app.list_books
    when '2'
      app.list_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_rentals_for_person
    when '7'
      puts 'Thank you for using this app, see you later!'
      break
    else
      puts 'Invalid input. Please try again.'
    end
  end
end

# Example usage:
library = Library.new
main(library)
