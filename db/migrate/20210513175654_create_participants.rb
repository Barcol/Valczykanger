class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :melange, null: false, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
