class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[edit update destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_badge_not_found

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image, :rule_type, :rule_value)
  end

  def rescue_with_badge_not_found
    flash[:warning] = "Badge not found"

    redirect_to admin_root_path
  end
end
