require 'spec_helper'

describe "Expensetypes" do
  describe "GET /expensetypes" do
    it "works! (now write some real specs)" do
      get expensetypes_path
      response.status.should be(200)
    end
  end
end
