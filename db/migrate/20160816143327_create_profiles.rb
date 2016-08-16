class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :breed, null: false, default: ''
      t.integer :yob, null: false
      t.string :image_url, null: false, default: ''
      t.string :favorite_nap_position, null: false, default: ''
      t.integer :purr_intensity, null: false, default: 5
      t.boolean :in_to_head_butts, null: false, default: false
      
      t.timestamps
    end
    add_reference :profiles, :user, index: true, foreign_key: true
  end
end
