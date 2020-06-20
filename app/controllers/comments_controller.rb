class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    movie = Movie.find(params[:movie_id])
    @comment = movie.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    Comment.find_by(id: params[:id], movie_id: params[:movie_id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  private

    def comment_params
      params.require(:comment).permit(:user_id, :movie_id, :content)
    end
end
