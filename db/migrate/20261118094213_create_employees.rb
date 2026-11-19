class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.references :department, foreign_key: true
      t.string :employee_code, null:false
      t.string :full_name, null: false
      t.string :phone, null: true
      t.date :hire_date, null:true
      t.integer :status,default: 1, null: false

      t.index :employee_code, unique:true
      t.check_constraint "status IN (0, 1)", name: "employees_status_check"
      t.timestamps
    end
  end
end
