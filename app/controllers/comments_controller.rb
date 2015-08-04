class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.create(strong_param)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: 'Film was successfully created.' }
        format.js
      else
        format.html { redirect_to post_path(@post) }
        format.js
      end
    end
  end

  def destroy
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'Post was successfully destroyed.' }
      format.js
    end
  end

  def votecomment
    value = params[:type] == "up" ? 1 : -1
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.add_or_update_evaluation(:votes, value, current_user)
    respond_to do |format|
      format.html { redirect_to :back, notice: "Thank you for voting" }
      format.js
    end
  end


  private
  def strong_param
    params.require(:comment).permit( :comment, :user_id)
  end
end
