class CommentsController < ApplicationController
  before_filter :find_snip
  
  def new
    @comment = @snip.comments.new
  end

  def create
    @comment = @snip.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to snip_path(@snip)
    else
      render :new
    end
  end

  private

  def find_snip
    @snip = current_user.snips.find(params[:snip_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :comment)
  end

end
