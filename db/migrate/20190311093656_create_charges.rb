class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.references :question, foreign_key: true
      t.boolean :paid, default: false
      t.decimal :total
      t.decimal :fee_charged
      t.string :stripe_charge_id

      t.timestamps
    end
  end
end
