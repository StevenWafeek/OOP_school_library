require_relative 'person'

class Teacher < Person
  attr_reader :specialization
  attr_accessor :rentals

  def initialize(name, age, specialization)
    super(name, age)
    @specialization = specialization
    @rentals = []
  end

  def can_use_services?
    true
  end
end
