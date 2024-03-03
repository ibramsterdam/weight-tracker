# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController  

  def new
    flash[:alert] = "No signups right now"
    redirect_to new_user_session_path
  end

  def create
    flash[:alert] = "No signups right now"
    redirect_to new_user_session_path
  end
end
