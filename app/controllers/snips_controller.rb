class SnipsController < ApplicationController
  before_action :require_login

  def index
    @snips = current_user.snips
  end

  def new
    @snip = Snip.new
  end

  def create
    @snip = current_user.snips.new(snip_params)
    if @snip.save
      redirect_to snips_path
    else
      render :new
    end
  end

  private

  def snip_params
    params.require(:snip).permit(:name, :description, :content)
  end
end
