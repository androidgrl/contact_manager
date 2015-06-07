require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { Person.new(first_name: "Jeff", last_name: "Gu") }
  it "is invalid without a first name" do
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it "is invalid without a last name" do
    person.last_name = nil
    expect(person).not_to be_valid
  end

  it "is valid" do
    expect(person).to be_valid
  end

  it "has a phone number" do
    expect(person.phone_numbers).to eq([])
  end

  it 'has an email address' do
    expect(person.email_addresses).to eq([])
  end
end
