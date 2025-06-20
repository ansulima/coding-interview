class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :display_name
      t.string :email
      t.string :username
      t.references :company, foreign_key: true
      t.timestamps
    end
    
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
