class UsersController < ApplicationController
  def show
    # User.find(params[:id])にてユーザを絞りこみ⇒対象IDのユーザーを@userに代入する
    # UserというモデルからこのID番号(実際にURLのリクエストで分かる)を取得する
    @user = User.find(params[:id])
    # 以下はアソシエーションを持っている同士の記述方法
    # @userに関連づけられた投稿すべて(.post_imagesを取得する)
    @post_images = @user.post_images
  end

  def edit
    
  end
end
