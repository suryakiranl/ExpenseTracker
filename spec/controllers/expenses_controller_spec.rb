require 'spec_helper'

describe ExpensesController do
  describe " GET #index " do
    it " comes back with 200 code " do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
