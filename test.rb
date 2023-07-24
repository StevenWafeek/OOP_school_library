require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'decorator'

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

# Test Person class
person = Person.new(22, name: 'maximilianus')
puts "Person's correct name: #{person.correct_name}"

# Test CapitalizeDecorator
capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized person's correct name: #{capitalized_person.correct_name}"

# Test TrimmerDecorator
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and trimmed person's correct name: #{capitalized_trimmed_person.correct_name}"
