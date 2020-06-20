class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.string :name, null: false
      t.string :smtp_key, null: false
      t.string :smtp_secret, null: false
      t.string :smtp_address, null: false
      t.integer :smtp_port, null: false
      t.string :smtp_authentication, null: false

      t.timestamps
    end
  end
end
