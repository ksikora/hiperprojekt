class Mailtoemail < ActiveRecord::Migration
  def change
		rename_column :users,  :mail, :email
  end

  def up
  end

  def down
  end
end
