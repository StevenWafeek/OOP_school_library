class Student < Person
  attr_reader :classroom
  attr_accessor :rentals

  def initialize(name, age, classroom)
    super(name, age)
    @classroom = classroom
    @rentals = [] # Initialize rentals as an empty array
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  # Convert Student object to a hash
  def to_hash
    {
      'class' => self.class.to_s,
      'id' => id,
      'name' => name,
      'age' => age,
      'classroom' => {
        'label' => classroom.label
      },
      'rentals' => rentals.map(&:to_hash) # Convert rentals array to an array of hashes
    }
  end

  # Create a Student object from a hash
  def self.from_hash(data)
    classroom = Classroom.new(data['classroom']['label'])
    student = self.new(data['name'], data['age'], classroom)
    student.instance_variable_set('@id', data['id'])
    rentals_data = data['rentals'] || [] # Handle the case when rentals data is missing
    student.rentals = rentals_data.map { |rental_data| Rental.from_hash(rental_data, student) }
    student
  end
end
