class CreateSubjectScores < ActiveRecord::Migration[8.0]
  def change
    create_table :subject_scores do |t|
      t.string :subject_name
      t.float :score

      t.timestamps
    end
  end
end
