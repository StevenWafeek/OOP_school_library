class Teacher < Person
  attr_reader :specialization

  def initialize(name, age, specialization)
    super(name, age)
    @specialization = specialization
  end

  def to_hash
    hash = super
    hash['specialization'] = @specialization
    hash
  end

  def self.from_hash(person_data)
    self.new(person_data['name'], person_data['age'], person_data['specialization'])
  end

  # Add a method to register rental for a book and person
  def register_rental(rental)
    @rentals << rental
  end
end

class Student < Person
  attr_reader :classroom

  def initialize(name, age, classroom)
    super(name, age)
    @classroom = classroom
  end

  def to_hash
    hash = super
    hash['classroom'] = {
      'label' => @classroom.label
    }
    hash
  end

  def self.from_hash(person_data)
    classroom = Classroom.new(person_data['classroom']['label'])
    self.new(person_data['name'], person_data['age'], classroom)
  end

  # Add a method to register rental for a book and person
  def register_rental(rental)
    @rentals << rental
  end
end
