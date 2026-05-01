class Professionals::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_professional!

  include DietParams

  private

  def authorize_professional!
    redirect_to root_path, alert: "Acesso não autorizado" unless current_user.professional?
  end
end
