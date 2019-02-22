class AddRecipientToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :recipient
    add_foreign_key :questions, :users, column: :recipient_id
  end
end
