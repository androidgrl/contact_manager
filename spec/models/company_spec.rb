require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { Company.new(name: "Acme") }
  it 'it valid' do
    expect(company).to be_valid
  end

  it 'is invalid without a namej' do
    company.name = nil
    expect(company).to_not be_valid
  end

  it 'responds with its created phone numbers' do
    phone_number = company.phone_numbers.build(number: "333-4444")
    expect(phone_number.number).to eq("333-4444")
  end
end
