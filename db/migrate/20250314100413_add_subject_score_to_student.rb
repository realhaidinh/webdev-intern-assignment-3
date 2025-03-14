class AddSubjectScoreToStudent < ActiveRecord::Migration[8.0]
  def change
    add_reference :subject_scores, :student, type: :string, null: false, foreign_key: true
  end
end
