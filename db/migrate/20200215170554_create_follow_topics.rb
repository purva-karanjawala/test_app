class CreateFollowTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_topics do |t|
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
