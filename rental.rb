class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    # Update associations
    book.rentals << self
    person.rentals << self
  end
end
