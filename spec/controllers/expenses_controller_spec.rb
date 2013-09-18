require 'spec_helper'

describe ExpensesController do
  # Basic test to check if the page is coming back successfully.
  describe " GET #index " do
    it " comes back with 200 code " do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  # Expense object that will be reused in below test cases.
  def gas_expense
    { amount: 12.50 , comment: 'Gas at Chevron', when: '2013-09-09', expensetype_id: 1 }
  end

  # Test the DESTROY method
  describe ': Request type - DELETE, Opearation - destroy ' do
    before {
      @exp = Expense.create! gas_expense
    }
     it 'deletes the object from database successfully' do
       expect {
          delete :destroy, { id: @exp.to_param }
       }.to change(Expense, :count).by(-1)
     end

     it " redirects the page to expenses_url after deleting the @expense object " do
       delete :destroy, { id: @exp.to_param }
       response.should redirect_to(expenses_url)
     end
  end
end
