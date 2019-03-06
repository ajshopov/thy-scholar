class AddPriceToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :price, :decimal
  end
end
