class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comments_params[:comment])
    @comment.save

    redirect_to @post
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to @comment.post
  end

  private

  def comments_params
    params.require(:comment).permit(:post_id, :text)
  end
end
