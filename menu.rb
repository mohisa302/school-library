class Menu
  MENU_OPTIONS = {
    '1' => :list_books,
    '2' => :list_people,
    '3' => :create_person,
    '4' => :create_book,
    '5' => :create_rental,
    '6' => :list_rentals_for_person,
    '7' => :exit
  }.freeze

  def initialize(app)
    @app = app
  end

  def show
    loop do
      print_menu_options

      choice = get_menu_choice

      if MENU_OPTIONS.include?(choice) # If the key is present
        method_name = MENU_OPTIONS[choice] # get value
        exit if method_name == :exit

        @app.send(method_name)
      else
        puts 'Invalid input. Please try again.'
      end
    end
  end

  private

  def print_menu_options
    puts "\nPlease choose an option by entering a number:"
    MENU_OPTIONS.each do |key, value|
      puts "#{key} - #{value.to_s.gsub('_', ' ')}" # replace underscores with spaces in the value string
    end
  end

  def get_menu_choice
    gets.chomp.downcase
  end
end
