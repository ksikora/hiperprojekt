class AccomodateToHiperprojekt < ActiveRecord::Migration

  def change
		rename_column :users, :email, :mail
		add_column :users, :surname, :string
  end

  def up
  end

  def down
  end


end
