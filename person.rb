class Person

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def speak
    p "Hi, my name is #{name}"
  end
end


class Student < Person

  def student_speak
    p "I get it!"
  end

end

class GoodStudent < Student
  def student_speak
    p "I'm a good student!"
  end
end

class BadStudent < Student
  def student_speak
    p "I'm a bad student!"
  end
end

class Instructor < Person

  def instructor_speak
    p "Everything in Ruby is an object."
  end

end

puts "What is the student name?"
student_name = gets.chomp
puts "What is the teacher name?"
teacher_name = gets.chomp

chris = Instructor.new(teacher_name)
chris.speak
chris.instructor_speak
christina = GoodStudent.new(student_name)
christina.speak
christina.student_speak
christina.instructor_speak
