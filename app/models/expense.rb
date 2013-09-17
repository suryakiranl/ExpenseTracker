class Expense < ActiveRecord::Base
  attr_accessible :amount, :expensetype_id, :when, :comment

  belongs_to :expensetype
  default_scope -> { order('expenses."when" DESC, expenses.created_at DESC') }

  validates :amount, :presence => true
  validates_numericality_of :amount, greater_than: 0
  validates :expensetype_id, :presence => true

  before_save :adjust_amount_to_2_decimals

  def adjust_amount_to_2_decimals
    self.amount = amount.round(2)
  end

  def self.created_between( from_datetime , to_datetime )
    where('expenses."when" BETWEEN ? AND ?', from_datetime , to_datetime )
  end

  def self.created_current_month
     Expense.created_between(DateTime.now.beginning_of_month.to_date, DateTime.now.end_of_month.to_date)
  end

  def self.expensetypes_and_sum_of_expenses_for_period( from_datetime , to_datetime )
    sql_query = 'SELECT SUM(expenses.amount) as amount_total, expensetypes.name as exptype_name ' +
        ' FROM "expensetypes" INNER JOIN "expenses" ON "expenses"."expensetype_id" = "expensetypes"."id" ' +
        ' WHERE expenses."when" BETWEEN ? AND ? ' +
        ' GROUP BY expensetypes.name '
    sql = self.sanitize_sql([sql_query, from_datetime , to_datetime])

    self.connection.execute(sql)
  end

  def self.expensetypes_and_sum_of_expenses_for_current_month
    Expense.expensetypes_and_sum_of_expenses_for_period(DateTime.now.beginning_of_month.to_date, DateTime.now.end_of_month.to_date)
  end
end
