class CreateMelange < ActiveRecord::Migration[6.1]
  def change
    create_table :melanges do |t|
      t.string :name
      t.datetime :event_date

      t.timestamps
    end
  end
end
