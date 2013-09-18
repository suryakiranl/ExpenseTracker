require 'spec_helper'

describe ExpensetypesController do
  # Basic test to check if the page is coming back successfully.
  describe " GET #index " do
    it " comes back with 200 code " do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  # Test the new operation
  describe " : Request type - GET, Opearation - new " do
    it " returns a new @expensetype object " do
      get :new, {}
      assigns(:expensetype).should be_a_new(Expensetype)
    end
  end

  # Define an expensetype object that will be reused in all the test cases below
  def rent_expensetype
    { name: 'Rent', description: 'Apartment rent' }
  end

  # Test the create method
  describe " : Request type - POST, Opearation - create " do
    describe " with valid parameters " do
      it " creates a new expensetype record in the DB " do
        # Check if DB count increases by 1
        expect {
          post :create, { expensetype: rent_expensetype }
        }.to change(Expensetype, :count).by(1)
      end

      describe do
        before {
          post :create, { expensetype: rent_expensetype }
        }
        it " returns the saved object as @expensetype " do
          assigns(:expensetype).should be_persisted
          assigns(:expensetype).should be_a(Expensetype)

        end

        it " redirects the page to expensetypes_url after saving the @expensetype object " do
          response.should redirect_to(expensetypes_url)
        end
      end
    end
  end

  # XML test case
  describe " : Request type - GET, Operation - show " do
    it " returns result as XML when requested for " do
      new_exptype = Expensetype.create! rent_expensetype
      get :show, { id: new_exptype.to_param, format: 'xml' } # We are passing hte ID and asking the format to be XML
      # We should get back data as XML and it will contain XML tags like - expensetype, name and description
      assert_tag tag: 'expensetype'
      assert_tag tag: 'name'
      assert_tag tag: 'description'
    end
  end

end
