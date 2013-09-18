require 'spec_helper'

describe Expense do
  before {
    @expensetype = Expensetype.new(name: 'Gas', description: 'Gasoline charges')
    @expensetype.save
    @expense = Expense.new(expensetype_id: @expensetype.id, amount: 100, when: '09/15/2013')
  }

  it { should respond_to(:amount) }
  it { should respond_to(:when) }
  it { should respond_to(:expensetype_id) }

  describe " expensetype_id is mandatory " do
    before {
      @expense.expensetype = nil
    }

    it { should_not be_valid }
  end

  describe " amount is mandatory " do
    before {
      @expense.amount = nil
    }

    it { should_not be_valid }
  end

  describe ' should round the amount to 2 digit precision ' do
    before {
      @expense.amount = 40.2455
      @expense.save
    }

    it { @expense.amount.to_f.should == 40.25.to_f }
  end


end
