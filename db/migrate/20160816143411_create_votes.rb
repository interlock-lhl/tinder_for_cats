class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :profile_id, null: false
      t.timestamps
    end
  end
end
