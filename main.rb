require_relative './app'
require_relative './library'

MENU_OPTIONS = {
  '1' => :list_books,
  '2' => :list_people,
  '3' => :create_person,
  '4' => :create_book,
  '5' => :create_rental,
  '6' => :list_rentals_for_person,
  '7' => :exit
}.freeze

def show_menu
  puts "\nPlease choose an option by entering a number:"
  MENU_OPTIONS.each do |key, value|
    puts "#{key} - #{value.to_s.gsub('_', ' ')}" # replace underscores with spaces in the value string
  end
end

def main(library)
  app = App.new(library)

  puts 'Hello here! welcome to School Library App!'
  puts ''

  loop do
    show_menu

    choice = gets.chomp.downcase

    if MENU_OPTIONS.include?(choice) # If the key is present
      method_name = MENU_OPTIONS[choice] # get value
      puts 'Thank you for using School Library, see you later!' if method_name == :exit
      exit if method_name == :exit

      app.send(method_name)
    else
      puts 'Invalid input. Please try again.'
    end
  end
end

library = Library.new
main(library)
