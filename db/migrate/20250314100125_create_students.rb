class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students, id: :string do |t|
      t.string :foreign_lang_id

      t.timestamps
    end
  end
end
