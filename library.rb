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
    p person
    json_person={}
    if(person.class.to_s == 'Student')
      json_person = {
                  type: person.class.to_s,
                  name: person.name,
                  age: person.age,
                  id: person.id,
                  parent_permission:person.parent_permission,
                  classroom: person.classroom
                }
    else
      json_person = {
                  type: person.class.to_s,
                  name: person.name,
                  age: person.age,
                  id: person.id,
                  specialization: person.specialization
                }

    end
     json_write('localstorage/person.json', json_person)
  end

  def add_book(book)
    @books.push(book)
    json_book = {title: book.title, author: book.author}
    json_write('localstorage/book.json', json_book)
  end

  def add_rental(rental)
    @rentals.push(rental)
    p rental
    json_rental = {date: rental.date,
      title: rental.book.title, author: rental.book.author,
      name: rental.person.name, age: rental.person.age, id: rental.person.id
  }
    json_write('localstorage/rental.json', json_rental)
  end
end
