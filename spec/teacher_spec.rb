require_relative 'spec_helper'
require_relative '../person'
require_relative '../teacher'

describe Student do
  before :each do
    @teacher = Teacher.new('specialization', 40, 'John', parent_permission: true)
  end

  it 'takes three parameters and returns a Teacher object' do
    expect(@teacher).to be_an_instance_of(Teacher)
  end

  it 'returns the correct age' do
    expect(@teacher.age).to eql 40
  end

  it 'returns the correct name' do
    expect(@teacher.name).to eql 'John'
  end

  it 'returns the correct parent permission' do
    expect(@teacher.parent_permission).to eql true
  end

  it 'can_use_services should return true' do
    expect(@teacher.can_use_services?).to eql true
  end
end
