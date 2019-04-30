class ClubsController < ApplicationController

	 # before_action :require_sign_in, only: [:delete, :destroy]

   before_action :authorize_user, only: [:delete, :destroy]

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
    @club = Club.new
  end

  def create
    @club = Club.new
    @club.name = params[:club][:name]
    @club.address = params[:club][:address]
    @club.contact = params[:club][:contact]
    @club.email = params[:club][:email]
    @club.club_type = params[:club][:club_type]
    @club.active = params[:club][:active]

    if @club.save
      flash[:notice] = "Club was saved."
      redirect_to @club
    else
      flash.now[:alert] = "There was an error saving the club. Please try again."
      render :new
    end
  end

  def edit
  	@club = Club.find(params[:id])
  end

  def update
  	@club.name = params[:club][:name]
    @club.address = params[:club][:address]
    @club.contact = params[:club][:contact]
    @club.email = params[:club][:email]
    @club.club_type = params[:club][:club_type]
    @club.active = params[:club][:active]

    if @club.save
      flash[:notice] = "Club was updated."
      redirect_to @club
    else
      flash.now[:alert] = "There was an error saving the changes. Please try again."
      render :edit
    end
  end

  def destroy
  	@club = Club.find(params[:id])

     if @club.destroy
       flash[:notice] = "\"#{@club.name}\" was deleted successfully."
       redirect_to clubs_path
     else
       flash.now[:alert] = "There was an error deleting the club."
       render :show
     end
  end

  private

    def authorize_user
      unless current_user.admin?
        flash[:alert] = "You must be an admin to do that."
        redirect_to club_path(params[:id])
      end
   end
end
