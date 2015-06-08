require 'rails_helper'

describe 'the company view', type: :feature do

  let(:company) { Company.create(name: "ACME")}

  describe 'phone numbers' do
    before(:each) do
      company.phone_numbers.create(number: "555-1234")
      company.phone_numbers.create(number: "333-1234")
      visit company_path(company)
    end

    it "shows phone numbers" do
      company.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add a new phone number' do
      expect(page).to have_link("Add phone number", href:new_phone_number_path(contact_id: company.id, contact_type: "Company"))
    end

    it 'adds a new phone number' do
      page.click_link("Add phone number")
      page.fill_in("Number", with: "555-8888")
      page.click_button("Create Phone number")
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content("555-8888")
    end

    it 'has links to edit phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_link("edit", href:edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = company.phone_numbers.first
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-1991')
      page.click_button('Update Phone number')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-1991')
      expect(page).to_not have_content(old_number)
    end

    it 'has links to delete phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_link("delete", href:phone_number_path(phone))
      end
    end

    it 'deletes a phone number' do
      first(:link, 'delete').click
      expect(current_path).to eq(company_path(company))
      expect(page).to_not have_content("555-1234")
    end
  end

  describe 'email addresses' do
    before(:each) do
      company.email_addresses.create(address: "jamie@gmail.com")
      company.email_addresses.create(address: "jamie@yahoo.com")
      visit company_path(company)
    end

    it 'has list of  the email addresses' do
      expect(page).to have_selector('li', text: "jamie@gmail.com")
      expect(page).to have_selector('li', text: "jamie@yahoo.com")
    end

    it 'has add new email address link' do
      expect(page).to have_link("Add email", href:new_email_address_path(contact_id: company.id, contact_type: "Company"))
      click_link('Add email')
      expect(current_path).to eq(new_email_address_path)
    end

    it 'deletes an email' do
      first(:link, 'delete').click
      expect(current_path).to eq(company_path(company))
      expect(page).to_not have_content("jamie@gmail.com")
    end

    it 'adds a new email address' do
      page.click_link('Add email')
      page.fill_in('Address', with: 'jamie@islandnet.com')
      page.click_button('Create Email address')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('jamie@islandnet.com')
    end

    it 'has link to edit email address' do
      company.email_addresses.each do |email|
        expect(page).to have_link("edit", href:edit_email_address_path(email))
      end
    end

    it 'edits an email address' do
      email = company.email_addresses.first
      old_address = email.address

      first(:link, "edit").click
      page.fill_in("Address", with: "interesting@gmail.com")
      page.click_button("Update Email address")
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content("interesting@gmail.com")
      expect(page).to_not have_content(old_address)
    end

    it 'has link to destroy email address' do
      company.email_addresses.each do |email|
        expect(page).to have_link("delete", href:email_address_path(email))
      end
    end
  end
end
