class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people, :force => true do |t|
      t.string    :name, :surname, :login, :email, :remember_token
      t.string    :crypted_password, :salt, :string, :limit => 40
      t.datetime  :remember_token_expires_at
      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
