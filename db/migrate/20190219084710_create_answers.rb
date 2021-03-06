class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :response
      t.references :user, foreign_key: true
      t.references :question, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
