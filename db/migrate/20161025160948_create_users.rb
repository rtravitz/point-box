class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false
      t.integer :points, default: 0
      t.integer :redeemed_points, default: 0
    end
  end
end
