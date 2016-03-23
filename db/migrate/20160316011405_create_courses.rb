class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :comment
      t.string :term
      t.string :code
      t.string :continuity_id
      t.string :name
      t.text :description
      t.float :credits
      t.boolean :independent_study
      t.string :subjects
      t.string :course_id
      t.string :requirements

      t.timestamps null: false
    end
  end
end
