module StaticHelper
  def sum_curr_month_expenses
    expenses_this_month = Expense.created_current_month
    sum = 0
    expenses_this_month.each do |expense|
      sum = sum + expense.amount
    end

    return sum
  end

  def expensetype_exists?
    expensetypes_cnt = Expensetype.count
    return expensetypes_cnt > 0 ? true : false
  end

  def pie_chart_for_expenses_this_month
    curr_month_exp = Expense.expensetypes_and_sum_of_expenses_for_current_month

    exp_hash = Hash.new()
    sum = 0
    curr_month_exp.each do |result_set|
      exp_hash[result_set["exptype_name"]] = result_set["amount_total"].round(2)
      sum = sum + result_set["amount_total"].round(2)
    end

    data = exp_hash.collect{ | exp_type, amnt | amnt }
    labels = exp_hash.collect{ |exp_type, amnt| "#{exp_type} : $#{amnt} - #{ amnt == 0 ? 0 : (100.0 * amnt / sum).round } %" }

    return Gchart.pie(:data => data, :labels => labels, :size => '740x380', :theme => :thirty7signals)
  end
end
