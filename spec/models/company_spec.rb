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

  it 'has a phone number' do
    expect(company.phone_numbers).to eq([])
  end
end
