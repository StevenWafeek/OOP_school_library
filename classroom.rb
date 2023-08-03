class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(value)
    @students.push(value)
    value.classroom = self
  end
end
