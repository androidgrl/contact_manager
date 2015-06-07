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

  it "responds with its created phone numbers" do
    person.phone_numbers.build(number: "555-0000")
    expect(person.phone_numbers.map(&:number)).to eq(["555-0000"])
  end

  it 'it responds with its created email addresses' do
    person.email_addresses.build(address: "jamie@gmail.com")
    expect(person.email_addresses.map(&:address)).to eq(["jamie@gmail.com"])
  end
end
