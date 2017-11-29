class AddBookOpinionToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :book_opinion, :text
  end
end
