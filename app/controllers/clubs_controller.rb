# frozen_string_literal: true

class ClubsController < ApplicationController
  def index
    @clubs = if params[:club]
               Club.where("name LIKE ?", "%#{params[:club]}%")
             else
               Club.all
             end
  end

  def show
    @club = Club.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
