class CreateLedgers < ActiveRecord::Migration[5.2]
  def change
    create_table :ledgers do |t|
      t.references :user, foreign_key: true, index:true
      t.string :kind
      t.decimal :value
      t.references :entity, foreign_key: true, index: true
      t.references :receiver, foreign_key: true, index: true
      t.string :note
      t.boolean :paid, default: true

      t.timestamps
    end
  end
end
