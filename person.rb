require './corrector'

class Person
  attr_reader :id
  attr_accessor :name, :age, :classroom, :rentals, :parent_permission

  def initialize(id:, age:, name: 'Unknown', parent_permission: true)
    @id = id || Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    return true if of_age? || @parent_permission
  end

  def validate_name
    @corrector.correct_name(@name)
  end

  private

  def of_age?
    return true if @age >= 10

    false
  end
end
