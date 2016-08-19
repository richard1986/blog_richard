class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.string :id_session
      t.integer :visists, default: "1"
      t.string :user_agent
      t.string :ip_client

      t.timestamps null: false
    end
  end
end
