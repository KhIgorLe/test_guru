class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_require!

  layout 'admin'

  private

  def admin_require!
    redirect_to root_path, alert: "Are you not authorized to view this page" unless current_user.is_a?(Admin)
  end
end
