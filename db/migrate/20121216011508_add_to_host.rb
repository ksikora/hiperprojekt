class AddToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :name, :string
    add_column :hosts, :host, :string
    add_column :hosts, :uri, :string
  end
end
