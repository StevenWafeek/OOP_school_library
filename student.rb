require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom
  attr_accessor :rentals

  def initialize(name, age, classroom)
    super(name, age)
    @classroom = classroom
    @rentals = []
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
