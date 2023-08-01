class Person
  attr_reader :id, :name, :age

  @@assigned_ids = [] # Class variable to store all assigned IDs

  def initialize(name, age)
    @id = generate_id
    @name = name
    @age = age
  end

  private

  def generate_id
    new_id = rand(1000..9999)
    while @@assigned_ids.include?(new_id) # Check if the ID is already assigned
      new_id = rand(1000..9999)
    end
    @@assigned_ids << new_id
    new_id
  end
end
