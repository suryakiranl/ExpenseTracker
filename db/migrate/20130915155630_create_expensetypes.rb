class CreateExpensetypes < ActiveRecord::Migration
  def change
    create_table :expensetypes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
