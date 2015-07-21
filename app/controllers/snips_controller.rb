class SnipsController < ApplicationController
  before_action :require_login
  #before_action :require_login, except: :show

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

  def show
    @snip = Snip.find(params[:id])
    @comments = @snip.comments.to_a
    @comment = @snip.comments.new
  end

  def edit
    @snip = current_user.snips.find(params[:id])
  end

  def update
    @snip = current_user.snips.find(params[:id])
    if @snip.update_attributes(snip_params)
      redirect_to @snip
    else
      render :edit
    end
  end

  def destroy
    snip = current_user.snips.find(params[:id])
    snip.destroy!
    redirect_to snips_path
  end

  private

  def snip_params
    params.require(:snip).permit(:name, :description, :language_id, :content)
  end
end
