class Authentications < ActiveRecord::Migration
  def up
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.integer :uid
      t.string :access_token
      t.timestamps
    end
  end

  def down
  end
end
