class BookedRoomsController < ApplicationController
  def index
    @booked_rooms = BookedRoom.includes(:room, :customer).all
  end
  
  def new
    @booked_room = BookedRoom.new
  end
  
  def create
    @booked_room = BookedRoom.new(booked_room_params)
    
    if @booked_room.save
      redirect_to @booked_room
    else
      render 'new'
    end
  end
  
  def show
    @booked_room = BookedRoom.includes(:room, :customer).find(params[:id])
  end
  
  def edit
    @booked_room = BookedRoom.find(params[:id])
  end
  
  def update
    @booked_room = BookedRoom.find(params[:id])
    
    if @booked_room.update(booked_room_params)
      redirect_to @booked_room
    else
      render 'edit'
    end
  end
  
  def destroy
    @booked_room = BookedRoom.find(params[:id])
    @booked_room.destroy
    
    redirect_to booked_rooms_path
  end
  
  private
  def booked_room_params
    params.require(:booked_room).permit(:start_date, :end_date, :status, :check_in, :check_out, :room_id, :customer_id)
  end
end
