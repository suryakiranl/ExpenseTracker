class Expensetype < ActiveRecord::Base
  attr_accessible :description, :name

  default_scope -> { order('expensetypes.name ASC') }
  has_many :expenses, dependent: :destroy

  validates :name, :presence => true, :length => { :maximum => 50 }, :uniqueness => true
  validates :description, :length => { :maximum => 255 }
end
