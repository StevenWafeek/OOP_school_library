class Book
  attr_reader :title, :author
  attr_accessor :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def to_hash
    {
      'title' => title,
      'author' => author
    }
  end

  def self.from_hash(book_data)
    self.new(book_data['title'], book_data['author'])
  end

  def add_rental(rental)
    @rentals << rental
  end
end
