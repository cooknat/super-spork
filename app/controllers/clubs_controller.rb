# frozen_string_literal: true

class ClubsController < ApplicationController
  def index
    if params[:club]
      @clubs = Club.where('name LIKE ?', "%#{params[:club]}%")
    else
      @clubs = Club.all
    end
  end

  def show
    @club = Club.find(params[:id])
  end
end

