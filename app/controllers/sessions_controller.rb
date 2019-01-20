class SessionsController < Devise::SessionsController
  after_action :greeting, only: :create

  private

  def greeting
    flash[:success] = "Hello #{current_user.first_name }"
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_tests_path
    else
      root_path
    end
  end
end
