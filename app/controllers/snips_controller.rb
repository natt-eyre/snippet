class SnipsController < ApplicationController

  def index
    @snips = Snip.all
  end

  def new
    @snip = Snip.new
  end

  def create
    @snip = Snip.new(snip_params)
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
