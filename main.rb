require_relative './app'
require_relative './library'
require_relative './menu'

library = Library.new
app = App.new(library)
menu = Menu.new(app)

puts 'Hello here! welcome to School Library App!'
puts ''

menu.show

