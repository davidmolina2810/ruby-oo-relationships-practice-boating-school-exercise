class Student
   
  attr_reader :first_name

  @@all = [] # holds all instances of Student

  def initialize(first_name)
    @first_name = first_name
    @@all << self # every time an instance initialized, add to list of all instances
  end

  def tests # returns array of all boatingtests of self-student
    return BoatingTest.all.select {|test| test.student == self}
  end

  def add_boating_test(test_name, status, instructor) # creates new boarding test for self-student and return arr of all boardingtests
    BoatingTest.new(self, test_name, status, instructor)
    return tests
  end

  def grade_percentage # returns self-student grade percentage of all tests
    one_point_if_passed = tests.map {|test| 1 if test.status == 'passed'} # return array where element is 1 if test passed and nil if failed
    one_point_if_passed = one_point_if_passed.delete_if {|num| num == nil} # remove nils
    return (one_point_if_passed.sum / tests.length .to_f).round(4) * 100
  end

  def all_instructors # returns arr of all instructors for self-student
    return tests.map {|test| test.instructor}
  end

  def self.find_student(first_name) # returns student by first_name
    return self.all.find {|student| student.first_name == first_name}
  end

end
