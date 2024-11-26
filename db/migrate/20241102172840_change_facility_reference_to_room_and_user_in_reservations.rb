class ChangeFacilityReferenceToRoomAndUserInReservations < ActiveRecord::Migration[6.1]
  def change
    remove_reference :reservations, :facility, foreign_key: true

    add_reference :reservations, :room, null: false, foreign_key: true
    add_reference :reservations, :user, null: false, foreign_key: true
  end
end
