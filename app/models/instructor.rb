class Instructor

  attr_reader :name

  @@all = [] # holds every instance of Instructor

  def initialize(name)
    @name = name
    Instructor.all << self # every time initialize, add self to list of all Instructor instances
  end

  def tests # returns array of every boating test this instructor has given
    return BoatingTest.all.select {|test| test.instructor == self}
  end

  def passed_students # returns array of student instances who have passed self-instructors boating test
    return tests.delete_if {|test| test.status == "failed" || test.status == "pending"}
  end

  def pass_student(student, test_name) # creates new BoatingTest and sets status to "passed"
    return new_test(student, test_name, "passed", self)
  end

  def fail_student(student, test_name) # creates new BoatingTest and sets status to "failed"
    return new_test(student, test_name, "failed", self)
  end

  def all_students # returns list of all student instances who have had self-instructor
    return tests.map {|test| test.student}.uniq
  end

  def self.all # returns all instances of Instructor
    return @@all
  end

  private
  def new_test(student, test_name, status, instructor) # creates new instance of BoatingTest if one hasn't been made with name test_name for student, student
    if !(tests.find {|test| test.student == student && test.test_name == test_name})
      BoatingTest.new(student, test_name, status, instructor)
    end
  end

end
