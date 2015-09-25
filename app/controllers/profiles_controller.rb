class ProfilesController < ApplicationController
  def index
    @alerts = Alert.where(:user_id => current_user.id)
  end

  def destroy
    alert = Alert.find(params[:id])
    alert.destroy
    flash[:success] = 'Alerta removido com sucesso!'
    redirect_to user_profile_path
  end
end
