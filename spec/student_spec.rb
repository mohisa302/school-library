require_relative 'spec_helper'
require_relative '../person'
require_relative '../student'
require_relative '../rental'

describe Student do
  before :each do
    @student = Student.new('4A', 17, 'John', parent_permission: true)
  end

  it 'takes three parameters and returns a Student object' do
    expect(@student).to be_an_instance_of(Student)
  end

  it 'returns the correct random id' do
    expect(@student.id).to eql @student.id
  end

  it 'returns the correct age' do
    expect(@student.age).to eql 17
  end

  it 'returns the correct name' do
    expect(@student.name).to eql 'John'
  end

  it 'returns the correct parent permission' do
    expect(@student.parent_permission).to eql true
  end

  it 'returns the correct classroom' do
    expect(@student.classroom).to eql '4A'
  end

  it 'returns the correct play_hooky' do
    expect(@student.play_hooky).to eql '¯(ツ)/¯'
  end
end
