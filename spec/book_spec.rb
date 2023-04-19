require_relative 'spec_helper'
require_relative '../student'
require_relative '../rental'
require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('Cry', 'John')
  end

  it 'takes three parameters and returns a Rental object' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'Should return length of rentals to 1 after adding one rental' do
    person = Student.new('4A', 17, 'John', parent_permission: true)
    @book.add_rental(person, '2022-10-2')
    expect(@book.rentals.length).to eq(1)
  end

  it 'Rentals array should return an instance of rental class' do
    person = Student.new('4A', 17, 'John', parent_permission: true)
    @book.add_rental(person, '2022-10-2')
    expect(@book.rentals.first).to be_an_instance_of(Rental)
  end
end
