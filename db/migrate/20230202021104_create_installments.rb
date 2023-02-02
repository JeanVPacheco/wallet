class CreateInstallments < ActiveRecord::Migration[5.2]
  def change
    create_table :installments do |t|
      t.references :entity, foreign_key: true
      t.references :user, foreign_key: true
      t.references :receiver, foreign_key: true
      t.decimal :total
      t.integer :number_of_installments
      t.decimal :value
      t.boolean :recorded, default: false, null: false
      t.integer :day, null: false, unsigned: true

      t.timestamps
    end
  end
end
