class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.boolean :master, default: false

      t.references :poker, foreign_key: true

      t.timestamps
    end
  end
end
