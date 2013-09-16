class Expense < ActiveRecord::Base
  attr_accessible :amount, :expensetype_id, :when, :comment

  belongs_to :expensetype
  default_scope -> { order('"when" DESC, created_at DESC') }

  validates :amount, :presence => true
  validates :expensetype_id, :presence => true
end