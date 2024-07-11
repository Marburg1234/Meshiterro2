class PostImagesController < ApplicationController

  # 投稿ページを作成
  def new
    @post_image = PostImage.new
    #インスタンス変数 = モデル名.new
    # newメソッド内に記述する内容=注意すること
  end

  # 投稿データの保存機能を追加
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    # @post_image.user_id = [モデル名].[カラム名]をすることで、
    # 保存するカラムの中身を指定できる
    # current_user.id=ログイン中のユーザー情報を取得する記述or表示する
    # current_user.name : ログイン中のユーザーの名前を表示
    # current_user.email : ログイン中のユーザーのメールアドレスを表示
    # current~ はdeviseのヘルパーメソッドである。
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end


  #ストロングパラメーターを追加する
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end


end
