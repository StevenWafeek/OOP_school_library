require './person'

class Teacher < Person
  def initialize(specialization:, age:, name: 'Unknown', parent_permission: true, id: nil)
    super(id: id, age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
