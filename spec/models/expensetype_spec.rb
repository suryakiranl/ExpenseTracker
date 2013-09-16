require 'spec_helper'

describe Expensetype do
  before {
    @expensetype = Expensetype.new(name: 'Gas', description: 'Gasoline expenses')
  }

  subject {
    @expensetype
  }

  it { should respond_to(:name) }
  it { should respond_to(:description) }


  describe " name is mandatory" do
    #Make the user name empty
    before {
      @expensetype.name = ''
    }

    it { should_not be_valid }
  end

  describe " name cannot be more than 50 chars long" do
    before {
      @expensetype.name = 'This is a very big string and it contains more than 50 characters in whole.';
    }

    it { should_not be_valid }
  end

  describe " name must be unique" do
    before {
      dup_expensetype = @expensetype.dup
      dup_expensetype.save
    }

    it { should_not be_valid }
  end

  describe " description cannot be more than 255 chars long" do
    before {
      # Make description really long
      @expensetype.description = 'desc' * 200
    }

    it { should_not be_valid }
  end

end
