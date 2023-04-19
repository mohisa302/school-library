require_relative 'spec_helper'
require_relative '../classroom'
require_relative '../student'

describe Classroom do

  before:each do
     @classroom = Classroom.new("Math")
    end

    it "returns the correct label" do
      expect(@classroom.label).to eql "Math"
    end
    
    it "Should return length of students to 1 after adding one student" do
      @student = Student.new("4A", 17, 'John', parent_permission: true)
      @classroom.add_student(@student)
      expect(@classroom.students.length).to eq(1)
    end
 
    it "Should return length of students to 2 after adding two students" do
      student_a = Student.new("4A", 17, 'John', parent_permission: true)
      student_b = Student.new("4A", 18, 'John', parent_permission: true)
      @classroom.add_student(student_a)
      @classroom.add_student(student_b)
      expect(@classroom.students.length).to eq(2)
    end

    it "adds the student to the classroom's students array" do
      student = Student.new("4A", 17, 'John', parent_permission: true)
      @classroom.add_student(student)
      expect(@classroom.students.first).to eq(student)
    end

    it "sets the student's classroom attribute to the current classroom object" do
      student = Student.new("4A", 17, 'John', parent_permission: true)
      @classroom.add_student(student)
      expect(student.classroom).to eq(@classroom)
    end


end
