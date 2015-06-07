require 'rails_helper'

RSpec.describe PhoneNumbersController, type: :controller do

  let(:valid_attributes) {
    { number: "1112223333", contact_id: 1, contact_type: "Person" }
  }

  let(:invalid_attributes) {
    { number: nil, contact_id: nil, contact_type: nil }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all phone_numbers as @phone_numbers" do
      phone_number = PhoneNumber.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:phone_numbers)).to eq([phone_number])
    end
  end

  describe "GET #show" do
    it "assigns the requested phone_number as @phone_number" do
      phone_number = PhoneNumber.create! valid_attributes
      get :show, {:id => phone_number.to_param}, valid_session
      expect(assigns(:phone_number)).to eq(phone_number)
    end
  end

  describe "GET #new" do
    it "assigns a new phone_number as @phone_number" do
      get :new, {}, valid_session
      expect(assigns(:phone_number)).to be_a_new(PhoneNumber)
    end
  end

  describe "GET #edit" do
    it "assigns the requested phone_number as @phone_number" do
      phone_number = PhoneNumber.create! valid_attributes
      get :edit, {:id => phone_number.to_param}, valid_session
      expect(assigns(:phone_number)).to eq(phone_number)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:alice) { Person.create(first_name: "Alice", last_name: "Smith") }
      let(:valid_attributes) { {number: "555-555-5555", contact_id: alice.id, contact_type: "Person" } }

      it "creates a new PhoneNumber" do
        expect {
          post :create, {:phone_number => valid_attributes}, valid_session
        }.to change(PhoneNumber, :count).by(1)
      end

      it "assigns a newly created phone_number as @phone_number" do
        post :create, {:phone_number => valid_attributes}, valid_session
        expect(assigns(:phone_number)).to be_a(PhoneNumber)
        expect(assigns(:phone_number)).to be_persisted
      end

      it "redirects to the phone number's contact" do
        alice = Person.create(first_name: "Alice", last_name: "Smith")
        valid_attributes = { number: "555-8888", contact_id: alice.id, contact_type: "Person" }
        post :create, {:phone_number => valid_attributes}, valid_session
        expect(response).to redirect_to(alice)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved phone_number as @phone_number" do
        post :create, {:phone_number => invalid_attributes}, valid_session
        expect(assigns(:phone_number)).to be_a_new(PhoneNumber)
      end

      it "re-renders the 'new' template" do
        post :create, {:phone_number => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      let(:bob) { Person.create(first_name: "Bob", last_name: "Jones") }
      let(:valid_attributes) {{number: "888-888-8888", contact_id: bob.id, contact_type: "Person"}}
      let(:new_attributes) {{number: "555-555-5555", contact_id: bob.id, contact_type: "Person"}}

      it "updates the requested phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => new_attributes}, valid_session
        phone_number.reload
        expect(phone_number.number).to eq("555-555-5555")
        expect(phone_number.contact_id).to eq(bob.id)
      end

      it "assigns the requested phone_number as @phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => valid_attributes}, valid_session
        expect(assigns(:phone_number)).to eq(phone_number)
      end

      it "redirects to the contact" do
        bob = Person.create(first_name: "Bob", last_name: "Jones")
        valid_attributes = {number: '555-5757', contact_id: bob.id, contact_type: "Person"}
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => valid_attributes}, valid_session
        expect(response).to redirect_to(bob)
      end
    end

    context "with invalid params" do
      it "assigns the phone_number as @phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => invalid_attributes}, valid_session
        expect(assigns(:phone_number)).to eq(phone_number)
      end

      it "re-renders the 'edit' template" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested phone_number" do
      bob = Person.create(first_name: "Bob", last_name: "Jones")
      valid_attributes = { number: "333-333-3333", contact_id: bob.id, contact_type: "Person" }
      phone_number = PhoneNumber.create! valid_attributes
      expect {
        delete :destroy, {:id => phone_number.to_param}, valid_session
      }.to change(PhoneNumber, :count).by(-1)
      expect(response).to redirect_to(bob)
    end

    it "redirects to contact" do
      bob = Person.create(first_name: "Bob", last_name: "Jones")
      valid_attributes = { number: "333-333-3333", contact_id: bob.id, contact_type: "Person" }
      phone_number = PhoneNumber.create! valid_attributes
      delete :destroy, {:id => phone_number.to_param}, valid_session
      expect(response).to redirect_to(bob)
    end
  end
end
