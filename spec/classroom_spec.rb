require './classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'Label'
  end

  it 'should detect the classroom label' do
    expect(@classroom.label).to eq 'Label'
  end

  it 'should detect the classroom students' do
    student = Student.new(age: 18, name: 'Student')
    @classroom.add_student(student)
    expect(@classroom.students.include?(student)).to eq true
    expect(student.classroom).to eq @classroom
  end
end
