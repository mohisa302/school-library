require_relative 'spec_helper'
require_relative '../student'
require_relative '../rental'
require_relative '../book'

describe Classroom do
  before :each do
    book = Book.new('Cry', 'John')
    person = Student.new('4A', 17, 'John', parent_permission: true)
    @rental = Rental.new(book, person, '2022-10-2')
  end

  it 'takes three parameters and returns a Rental object' do
    expect(@rental).to be_an_instance_of(Rental)
  end
end
