class ProfilesController < ApplicationController
  def index
    @alerts = Alert.where(:user_id => current_user.id)
  end
end
