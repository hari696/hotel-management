class DashboardController < ApplicationController
  def dashboard
    @available_rooms = Room.all
  end
  
  def search
    @search_keyword = params[:room][:q]

    @available_rooms = if @search_keyword
      Room.where(id: 1)
    else
      Room.all
    end
  end
end
