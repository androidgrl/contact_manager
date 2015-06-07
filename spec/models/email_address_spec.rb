require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:email) { EmailAddress.new(address: "jamie@gmail.com", person_id: 1) }

  it 'is valid' do
    expect(email).to be_valid
  end

  it 'is invalid without an address' do
    email.address = nil
    expect(email).to_not be_valid
  end

  it 'must have a reference to a person' do
    email.person_id = nil
    expect(email).to_not be_valid
  end
end
