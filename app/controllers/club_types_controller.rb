# frozen_string_literal: true

class ClubTypesController < ApplicationController
  def new
    @club_type = ClubType.new
  end

  def create
    @club_type = ClubType.new
    @club_type.name = params[:club_type][:name]

    if @club_type.save
      flash[:notice] = "Club type was saved."
      redirect_to new_club_path
    else
      flash.now[:alert] = "There was an error saving the club type. Please try again."
      render :new
    end
  end
end
