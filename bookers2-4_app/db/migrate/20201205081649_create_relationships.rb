class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer "follower_id"
      t.integer "followed_id"
      # t.references :follow, foreign_key: true
      # t.references :followed, foreign_key: true
      t.timestamps
      # t.index [:user_id, :follow_id], unique: true
    end
  end
end
