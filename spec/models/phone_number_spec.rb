require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:person) { Person.create(first_name: "Joe", last_name: "Trader") }
  let(:phone_number) { PhoneNumber.new(number: "1112223333", contact_id: person.id, contact_type: "Person") }

  it "is valid" do
    expect(phone_number).to be_valid
  end

  it 'is invalid without a phone_number' do
    phone_number.number = nil
    expect(phone_number).to_not be_valid
  end

  it 'must have a reference to a person' do
    phone_number.contact_id = nil
    expect(phone_number).to_not be_valid
  end

  it 'belongs to a person' do
    expect(phone_number).to respond_to(:contact)
  end
end
