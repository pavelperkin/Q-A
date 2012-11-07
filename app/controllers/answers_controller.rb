class AnswersController < ApplicationController
  def save
    @answer_params = { #get params from Alax
      :data    => params[:data] ,
      :quest_id => params[:q_id]  
       }
        @answer = Answer.new(@answer_params) #create nwe answer with params
        @answer.user_id=current_user.id # add set author as current user
        @answer.rank=0 #set rank 
        @answer.save() # save answer to db
    @response = {:status => "true"} 
    render json: @response
  end
  
  def rank
    @answer_params = {
        :id => params[:a_id]  
       }	   
        @answer= Answer.find(params[:a_id] )
			if params[:action_type]=='inc' then
				@answer.rank+=1
			else
			   @answer.rank-=1
			end
      @answer.save()
      @response = {:status => "true",
                           :data => @answer.rank ,
                           :id => @answer.id.to_s,
						   }
    render json: @response
    
  end
  
  

  
  
  
  end

