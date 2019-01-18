class SessionsController < Devise::SessionsController
  after_action :greeting, only: :create
  private

  def greeting
    flash[:success] = "Hello #{current_user.first_name}"
  end
end
