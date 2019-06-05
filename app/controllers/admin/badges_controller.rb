class Admin::BadgesController < Admin::BaseController
  def index
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
  end

  def destroy
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image, :rule_type, :rule_value)
  end
end
