class AddUserRefToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :sender
    add_foreign_key :questions, :users, column: :sender_id
  end
end
