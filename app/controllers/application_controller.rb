# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  def find_owner_by_club_id(club_id)
  	user_id = Club.find(club_id).user_id
  	User.find(user_id)
  end
end
