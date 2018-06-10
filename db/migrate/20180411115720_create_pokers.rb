class CreatePokers < ActiveRecord::Migration[5.2]
  def change
    create_table :pokers do |t|
      t.integer :pin_code
      t.boolean :locked, default: false
      t.integer :suggested

      t.timestamps
    end
  end
end
