class DashboardController < ApplicationController
  def dashboard
    @available_rooms = Room.get_available_rooms
  end
  
  def search
    @search_keyword = params[:room][:q]

    @available_rooms = if @search_keyword
      Room.search_rooms(@search_keyword)
    else
      Room.get_available_rooms
    end
  end
end
