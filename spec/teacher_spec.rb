require_relative '../teacher.rb'

RSpec.describe Teacher do
  describe '#can_use_services?' do
    it 'should always return true' do
      teacher = Teacher.new(id: 5, age: 30, name: 'Alice', specialization: 'Math')
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end