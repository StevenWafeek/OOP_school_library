class Rental
  attr_accessor :date, :book, :person

  @assigned_ids = []

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end

  class << self
    attr_reader :assigned_ids
  end
end
