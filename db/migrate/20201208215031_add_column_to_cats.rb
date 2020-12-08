class AddColumnToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :description, :text
  end
end
