class Admin::BadgesController < Admin::BaseController
  before_action :set_badges, only: %i[index]
  before_action :set_badge, only: %i[show destroy]

  def index
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success')
  end

  private

  def set_badges
    @badges = Badge.all
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end  

  def badge_params
    params.require(:badge).permit(:title, :image, :color, :rule_type, :rule_value, :test, :category, :level)
  end
end