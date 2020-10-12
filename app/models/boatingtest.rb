class BoatingTest

  attr_reader :test_name
  attr_accessor :student, :instructor, :status

  @@all = [] # holds all instances of BoatingTest

  def initialize(student, test_name, status, instructor)
    @student = student
    @test_name = test_name
    @status = status
    @instructor = instructor
    @@all << self # add every initialized instance to array of all BoatingTest instance
  end

  def self.find_by_name(name) # returns BoatingTest by test_name
    return BoatingTest.all.find {|test| test.test_name == name}
  end

  def self.all # returns array of every instance of BoatingTest
    return @@all
  end 

end
