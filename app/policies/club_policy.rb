# frozen_string_literal: true

class ClubPolicy
  attr_reader :user, :club

  def initialize(user, club)
    @user = user
    @club = club
  end

  # def delete?
  #   user.admin? &&  (! club.active?)
  # end
end
