class AddStateToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :state, :string
  end
end
