class ChangeColumnSexAgain < ActiveRecord::Migration[5.2]
  def change
  change_column :cats, :sex, :string, limit: 1
  end
end
