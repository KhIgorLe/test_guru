class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_require!

  layout 'admin'

  private

  def admin_require!
    unless current_user.admin?
      flash[:warning] = "Are you not authorized to view this page"

      redirect_to root_path
    end
  end
end
