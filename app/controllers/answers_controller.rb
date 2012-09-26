class AnswersController < ApplicationController
  def save
    @answer_params = {
      :data    => params[:data] ,
      :quest_id => params[:q_id]  
       }
        @answer = Answer.new(@answer_params)
        @answer.user_id=current_user.id
        @answer.rank=0  
        @answer.save()
    @response = {:status => "true"}
    render json: @response
  end
  
  def rank_inc
    @answer_params = {
        :id => params[:a_id]  
       }
        @answer= Answer.find(params[:a_id] )
      @answer.rank+=1
      @answer.save()
      @response = {:status => "true",
                           :data => @answer.rank ,
                           :id => @answer.id.to_s}
    render json: @response
    
  end
  
  
  def rank_dec
    @answer_params = {
        :id => params[:a_id]  
       }
        @answer= Answer.find(params[:a_id] )
      @answer.rank-=1
      @answer.save()
      @response = {:status => "true",
                           :data => @answer.rank ,
                           :id => @answer.id.to_s}
    render json: @response    
  end  
  
  
  
  end

