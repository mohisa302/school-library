class Rental 
  attr_reader :book, :person
  attr_accessor :date
  
  def initialize(book, person, date)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end
end
