class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.references :user, foreign_key: true
      t.text :body
      t.timestamps
    end
  end
end
