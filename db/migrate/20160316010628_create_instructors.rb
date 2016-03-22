class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :email
      t.string :first
      t.string :middle
      t.string :last
      t.text :comment

      t.timestamps null: false
    end
  end
end
