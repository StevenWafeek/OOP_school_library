require './person'

describe Person do
  before :each do
    @person = Person.new age: 9, name: 'steev', id: nil

    @person_two = Person.new age: 15, name: 'Karel van Oordt Dellepiane', id: nil
  end

  it 'should validate the age of the person created' do
    expect(@person.age).to eq 9
    expect(@person_two.age).to eq 15
  end

  it 'should validate the name of the person created' do
    expect(@person.name).to eq 'steev'
    expect(@person_two.name).to eq 'Karel van Oordt Dellepiane'
  end

  it 'should validate the corrector method' do
    expect(@person.validate_name).to eq 'Steev'
    expect(@person_two.validate_name).to eq 'Karel van'
  end

  it 'should validate the can_use_services method' do
    expect(@person.can_use_services?).to eq true
    expect(@person_two.can_use_services?).to eq true
  end
end
