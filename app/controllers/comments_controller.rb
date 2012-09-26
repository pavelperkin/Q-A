class CommentsController < ApplicationController
  def save
     @comment_params = {
      :body    => params[:data] ,
      :answer_id => params[:a_id],
      :quest_id => params[:q_id]  
       }
        @comment = Comment.new(@comment_params)
        @comment.user_id=current_user.id
        @comment.save()
    @response = {:status => "true"}
    render json: @response
  end
end
