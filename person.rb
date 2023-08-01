class Person
  attr_reader :id, :name, :age

  @assigned_ids = []

  def initialize(name, age)
    @id = generate_id
    @name = name
    @age = age
  end

  def self.assigned_ids
    @assigned_ids ||= [] # Lazy initialization using ||= to prevent nil
  end

  private

  def generate_id
    new_id = nil
    loop do
      new_id = rand(1000..9999)
      break unless self.class.assigned_ids.include?(new_id)
    end
    self.class.assigned_ids << new_id
    new_id
  end
end
