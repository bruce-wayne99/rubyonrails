class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :qtype
      t.text :qstring
      t.string :optionA
      t.string :optionB
      t.string :optionC
      t.string :optionD
      t.string :answer
      t.references :subgenre, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
