class PostCommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments
    @post_comment = PostComment.new
    set_meta_tags title: 'Post Comments',
    description: 'Watch upcoming FIFA World Cup matches with like-minded fans who support your team.
    Find events near you or create your own.',
    keywords: 'world cup, FIFA, matches, fans, soccer, football,
    soccer fans, football fans, events, meet up, find fans,
    team, football team',
    og: {
      description: 'Team up to watch the FIFA World Cup. Find events near you or create your own,
      chat with other fans, and share posts.',
      type: 'mobile app',
      url: 'www.fan-find.com',
      image: 'metatag-photo.png'
    }
  end

  def new
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.post = @post
    @post_comment.user = current_user
    if @post_comment.save
      redirect_to post_post_comments_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    @post = Post.find(params[:post_id])
    @post_comment.post = @post
    redirect_to post_post_comments_path(@post), status: :see_other
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :user_id, :post_id)
  end
end
