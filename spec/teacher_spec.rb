require '../teacher' 
describe TeacherTest do 
  context "With valid input" do 
    it "should detect when a string doesn't contain vowels" do 
      sa = StringAnalyzer.new 
      test_string = 'bcdfg' 
      expect(sa.has_vowels? test_string).to be false
   end 
  
  end 
end
