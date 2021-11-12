class AddPosterToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :poster, :string
  end
end
