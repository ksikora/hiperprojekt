class ModifyFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :name, :string
		add_column :feeds, :monitor_name, :string
		add_column :feeds, :host_name, :string
		add_column :feeds, :monitor_feed_uri, :string

  end
end
