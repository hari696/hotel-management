require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  login_user
  
  describe "GET index" do
    it "assigns all customers as @customers" do
      customers = FactoryGirl.create(:customer)
      get :index
      expect(assigns(:customers)).to eq([customers])
    end
  end
  
  describe "GET new" do
    it "assigns a new customer as @customer" do
      get :new
      expect(assigns(:customer)).to be_a_new(Customer)
    end
  end
end
