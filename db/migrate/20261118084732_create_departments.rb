class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :name, null: false 
      t.text :description
      t.integer :status, default: 1, null: false
      t.timestamps

      t.index :name, unique: true
      t.check_constraint "status IN (0, 1)", name: "departments_status_check"
    end
  end
end
