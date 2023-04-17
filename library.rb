class Library
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def add_person(person)
    @people.push(person)
  end

  def add_book(book)
    @books.push(book)
  end

  def add_rental(rental)
    @rentals.push(rental)
  end
end
