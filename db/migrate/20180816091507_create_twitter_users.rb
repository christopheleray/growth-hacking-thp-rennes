class CreateTwitterUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :twitter_users do |t|
      t.integer :twitter_id

      t.timestamps
    end
  end
end
