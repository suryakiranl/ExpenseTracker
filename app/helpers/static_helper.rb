module StaticHelper
  def sum_curr_month_expenses
    expenses = Expense.where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_month, DateTime.now.end_of_month )
    @sum = 0
    expenses.each do |expense|
      @sum = @sum + expense.amount
    end

    return @sum
  end

  def expensetype_exists?
    expensetypes_cnt = Expensetype.count
    return expensetypes_cnt > 0 ? true : false
  end
end
