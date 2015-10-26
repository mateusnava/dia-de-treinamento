class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.references :usuario, index: true
      t.datetime :data
      t.string :ip

      t.timestamps
    end
  end
end
