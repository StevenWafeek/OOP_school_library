require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'decorator'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
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

# Create classrooms and students
classroom_a = Classroom.new('Class A')
classroom_b = Classroom.new('Class B')

# Creating students with age, classroom, name, and parent_permission
student1 = Student.new(18, classroom_a, name: 'John', parent_permission: true)
student2 = Student.new(17, classroom_b, name: 'Jane', parent_permission: false)

# Add students to classrooms
classroom_a.add_student(student1)
classroom_b.add_student(student2)

# Create books and people
book1 = Book.new('Book 1', 'Author 1')
book2 = Book.new('Book 2', 'Author 2')

person1 = Person.new(1, name: 'Person 1')
person2 = Person.new(2, name: 'Person 2')

# Create rentals
Rental.new('2023-07-24', book1, person1)
Rental.new('2023-07-25', book2, person1)
Rental.new('2023-07-26', book1, person2)

puts "#{person1.name}'s rentals:"
person1.rentals.each do |rental|
  puts "Book: #{rental.book.title}, Date: #{rental.date}"
end

puts "#{book1.title}'s rentals:"
book1.rentals.each do |rental|
  puts "Person: #{rental.person.name}, Date: #{rental.date}"
end
