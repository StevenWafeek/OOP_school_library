require './rental'
require './student'
require './book'

describe Rental do
  before :each do
    @book = Book.new 'Title', 'Author'
    @student = Student.new age: 16, name: 'Shahier'
    @rental = Rental.new '2022-01-25', @book, @student
  end

  it 'should detect the rental date' do
    expect(@rental.date).to eq '2022-01-25'
  end

  it 'should detect the rental book' do
    expect(@rental.book.rentals.include?(@rental)).to eq true
  end

  it 'should detect the rental student' do
    expect(@rental.person.rentals.include?(@rental)).to eq true
  end
end
