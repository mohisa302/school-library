require './module/json_read_write'
class Library
  include JsonReadWrite
  attr_reader :books, :people, :rentals

  def initialize
    @books = json_read('localstorage/book.json') || []
    @people = json_read('localstorage/person.json') || []
    @rentals = json_read('localstorage/rental.json') || []
  end

  def add_person(person)
    @people.push(person)
    json_person = if person.instance_of?(::Student)
                    {
                      type: person.class.to_s,
                      name: person.name,
                      age: person.age,
                      id: person.id,
                      parent_permission: person.parent_permission,
                      classroom: person.classroom
                    }
                  else
                    {
                      type: person.class.to_s, name: person.name,
                      age: person.age,
                      id: person.id,
                      specialization: person.specialization
                    }

                  end
    json_write('localstorage/person.json', json_person)
  end

  def add_book(book)
    @books.push(book)
    json_book = { title: book.title, author: book.author }
    json_write('localstorage/book.json', json_book)
  end

  def add_rental(rental)
    @rentals.push(rental)
    json_rental = {
      date: rental.date,
      name: rental.person.name, age: rental.person.age, id: rental.person.id,
      book: {
        title: rental.book.title,
        author: rental.book.author
      }
    }

    json_write('localstorage/rental.json', json_rental)
  end
end
