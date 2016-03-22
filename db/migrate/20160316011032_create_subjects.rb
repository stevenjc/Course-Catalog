class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.text :comment
      t.string :term
      t.string :name
      t.string :abbreviation
      t.string :segments
      t.string :subject_id

      t.timestamps null: false
    end
  end
end
