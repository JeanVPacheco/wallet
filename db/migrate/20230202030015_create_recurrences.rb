class CreateRecurrences < ActiveRecord::Migration[5.2]
  def change
    create_table :recurrences do |t|
      t.references :entity, foreign_key: true
      t.decimal :value
      t.integer :version
      t.string :frequency
      t.integer :day

      t.timestamps
    end
  end
end
