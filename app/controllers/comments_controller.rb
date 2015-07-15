class CommentsController < ApplicationController
  

  def create
    @comment = @snip.comments.new(comment_params)
    if @comment.save
      redirect_to snip_path(snip)
    else
      render :new
    end
  end

end
