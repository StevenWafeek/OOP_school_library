class Person
  attr_reader :id, :name, :age
  attr_accessor :rentals

  @@id_counter = 0

  def initialize(name, age)
    @id = generate_id
    @name = name
    @age = age
    @rentals = []
  end

  def to_hash
    hash = {
      'class' => self.class.to_s,
      'id' => id,
      'name' => name,
      'age' => age
    }

    # Include additional attributes for subclasses
    if self.is_a?(Student)
      hash['classroom'] = {
        'label' => classroom.label
      }
    elsif self.is_a?(Teacher)
      hash['specialization'] = specialization
    end

    hash
  end

  def self.from_hash(person_data)
    if person_data['class'] == 'Student'
      classroom = Classroom.new(person_data['classroom']['label'])
      Student.new(person_data['name'], person_data['age'], classroom)
    elsif person_data['class'] == 'Teacher'
      Teacher.new(person_data['name'], person_data['age'], person_data['specialization'])
    else
      raise ArgumentError, 'Invalid person class in JSON data'
    end
  end

  def add_rental(rental)
    @rentals << rental
  end

  private

  def generate_id
    @@id_counter += 1
  end
end
