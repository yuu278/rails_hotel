class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:show, :edit, :update, :destroy]
    before_action :set_room
    before_action :authenticate_user!

    def index
        @reservations = current_user.reservations.includes(:room)
    end

    def show
    end

    def new
        @room = Room.find(params[:room_id])
        @reservation = @room.reservations.new
    end

    def create
        @room = Room.find(params[:room_id])
        @reservation = @room.reservations.new(reservation_params)
        @reservation.user = current_user
        if @reservation.save
            redirect_to room_reservations_path(@room), notice: '予約が完了しました'
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @reservation.update(reservation_params)
            redirect_to room_path(@reservation.room), notice: '予約情報が更新されました'
        else
            render :edit
        end
    end

    def destroy
        @reservation.destroy
        redirect_to reservations_url, notice: '予約が削除されました'
    end

    private

    def set_reservation
        @reservation = Reservation.find(params[:id])
    end

    def set_room
        @room = Room.find(params[:room_id])
    end

    def reservation_params
        params.require(:reservation).permit(:check_in, :check_out, :guests)
    end
end