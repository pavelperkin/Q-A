class CommentsController < ApplicationController
  def save
     @comment_params = { #get params from Ajax
      :body    => params[:data] ,
      :answer_id => params[:a_id],
      :quest_id => params[:q_id]  
       }
        @comment = Comment.new(@comment_params) # create new comment
        @comment.user_id=current_user.id # set author as current user
        @comment.save() # save a comment
    @response = {:status => "true"}
    render json: @response
  end
end
