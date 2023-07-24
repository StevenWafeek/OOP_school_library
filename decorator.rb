# Base Decorator class
require_relative 'person'

# Base Decorator class
class Decorator < Person
  def initialize(nameable)
    super(nameable.age, parent_permission: nameable.instance_variable_get(:@parent_permission), name: nameable.name)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# CapitalizeDecorator class
class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end

# TrimmerDecorator class
class TrimmerDecorator < Decorator
  def correct_name
    super[0..9]
  end
end
