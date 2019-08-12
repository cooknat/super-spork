# frozen_string_literal: true

class ClubType < ApplicationRecord
  def self.find_by_name(name)
    ClubType.where(name: name)
  end

  def self.find_or_initialize_by(name)
    find_by(name: name) || ClubType.new
  end
end
