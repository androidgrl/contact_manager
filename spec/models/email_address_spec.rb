require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:person) { Person.create(first_name: "Jamie", last_name: "Kawahara") }
  let(:email) { EmailAddress.new(address: "jamie@gmail.com", contact_id: person.id, contact_type: "Person") }

  it 'is valid' do
    expect(email).to be_valid
  end

  it 'is invalid without an address' do
    email.address = nil
    expect(email).to_not be_valid
  end

  it 'must have a reference to a contact' do
    email.contact_id = nil
    expect(email).to_not be_valid
  end

  it 'is associated with a contact' do
    expect(email).to respond_to(:contact)
  end
end
