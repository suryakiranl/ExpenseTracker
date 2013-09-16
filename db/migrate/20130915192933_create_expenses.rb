class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :expensetype_id
      t.decimal :amount
      t.date :when

      t.timestamps
    end
  end
end
