class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.integer :guests
      t.references :facility, null: false, foreign_key: true

      t.timestamps
    end
  end
end
