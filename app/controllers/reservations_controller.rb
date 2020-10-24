class ReservationsController < ApplicationController
# before_action :find_trait, only: [:show, :new, :create, :edit, :destroy]

before_action :find_reservation, only: [:show, :edit, :destroy]

  def index
    # show all the reservations to all the user?
    # show all the reservations for a specific user?
    @reservations = Reservation.all
  end

  def show
    #we need to add SHOW in the config/routes?
    # :trait_id/reservations/:id
  end

  def new
    @trait = Trait.find(params[:trait_id])
    @reservation = Reservation.new
  end

  def create
    # raise
    @trait = Trait.find(params[:trait_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.trait = @trait
    @reservation.user = current_user

    if @reservation.save
      redirect_to trait_reservation_path(@trait, @reservation)
    else
      # @trait = Trait.find(params[:trait_id])
      render :new
    end
  end

  def edit;end

  def update
      if @reservation.updat(reservation_params)
      redirect_to reservations_path
    else
      render :new
    end
  end

  def destroy
    @reservation.destroy
    redirect_to trait_reservations_path(@reservation)
  end



  private

  # def find_trait
  #    @trait = Trait.find(params[:trait_id])
  # end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
