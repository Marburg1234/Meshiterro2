class PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    #↑の記述は、省略した記述になっている、意味としては下の2文
    #comment = PostComment.new(post_comment_params)
    #comment.user_id = current_user.id

    comment.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  # ストロングパラメーターで検証機能を記述する
  # paramsは実際にユーザーが投稿したデータ群のこと
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
