require_relative 'spec_helper'
require_relative '../person'
require_relative '../student'
require_relative '../rental'
require_relative '../teacher'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

describe Person do
   before :each do
      @person = Person.new( 17,'zewdu erkyhun', true)
    end
    it 'should be an instance of Person' do
      expect(@person).to be_an_instance_of(Person)
    end
    it 'should have an id' do
      expect(@person.id).to eql @person.id
    end
    it 'should have an age' do
      expect(@person.age).to eql 17
    end
    it 'should have a name' do
      expect(@person.name).to eql 'zewdu erkyhun'
    end
    it 'should have a can_use_services' do
      expect(@person.can_use_services?).to  eql true
    end
    it 'should be capitalizes the name with decorator' do
      @person = CapitalizeDecorator.new(@person)
      expect(@person.correct_name).to eql 'Zewdu erkyhun'
    end
    it 'should be Trimmed the name with decorator' do
      @person = TrimmerDecorator.new(@person)
      expect(@person.correct_name).to eql 'zewdu erky'
    end
    it 'should have a add_rental' do
      expect(@person.add_rental("book", "date")).to be_an_instance_of(Rental)
    end
end
