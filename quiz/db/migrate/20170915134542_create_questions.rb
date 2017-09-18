class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :qtype
      t.text :qstring
      t.references :subgenre, foreign_key: true
      t.integer :score
      t.binary :picture
      t.timestamps
    end
  end
end
