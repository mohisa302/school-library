require_relative './app'
require_relative './library'
require_relative './menu'


def main
  library = Library.new
  app = App.new(library)
  menu = Menu.new(app)
  menu.show
end
puts 'Hello here! welcome to School Library App!'
puts ''

main
