class CreateChooseCards < ActiveRecord::Migration[5.2]
  def change
    create_table :choose_cards do |t|
      t.references :member, foreign_key: true
      t.references :poker, foreign_key: true
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
