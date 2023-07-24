require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Create a new student
student = Student.new(16, 'Biology')

# Test the getters
puts "Student name: #{student.name}"
puts "Student age: #{student.age}"
puts "Student ID: #{student.id}"
puts "Student classroom: #{student.classroom}"

# Test the setters
student.name = 'Jane'
student.age = 17
student.classroom = 'Chemistry'

puts "Student name: #{student.name}"
puts "Student age: #{student.age}"
puts "Student ID: #{student.id}"
puts "Student classroom: #{student.classroom}"

# Test the can_use_services? method
puts "Can student use services?: #{student.can_use_services?}"
puts "Student played hooky: #{student.play_hooky}"

# Create a new teacher
teacher = Teacher.new(35, 'Math')

# Test the getters
puts "Teacher name: #{teacher.name}"
puts "Teacher age: #{teacher.age}"
puts "Teacher ID: #{teacher.id}"
puts "Teacher specialization: #{teacher.specialization}"

# Test the setters
teacher.name = 'John'
teacher.age = 40
teacher.specialization = 'Science'

puts "Teacher name: #{teacher.name}"
puts "Teacher age: #{teacher.age}"
puts "Teacher ID: #{teacher.id}"
puts "Teacher specialization: #{teacher.specialization}"

# Test the can_use_services? method
puts "Can teacher use services?: #{teacher.can_use_services?}"
