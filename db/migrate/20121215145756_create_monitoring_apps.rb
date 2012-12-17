class CreateMonitoringApps < ActiveRecord::Migration
  def change
    create_table :monitoring_apps do |t|

      t.timestamps
    end
  end
end
