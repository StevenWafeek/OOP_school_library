require './student'
require './classroom'

describe Student do
  before :each do
    @classroom = Classroom.new 'label'
    @student = Student.new age: 16, name: 'Marco'
  end

  it 'should validate the student age' do
    expect(@student.age).to eq 16
  end

  it 'should validate the play_hooky method' do
    expect(@student.play_hooky).to eq '¯\(ツ)/¯'
  end

  it 'should validate the join_classroom method' do
    @student.join_classroom(@classroom)
    expect(@classroom.students.include?(@student)).to eq true
  end
end
