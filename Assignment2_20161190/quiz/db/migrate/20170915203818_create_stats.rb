class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.integer :qnumber
      t.integer :score
      t.references :user, foreign_key: true
      t.references :subgenre, foreign_key: true
      t.integer :fifty_fifty
      t.integer :audience_poll
      t.timestamps
    end
  end
end
