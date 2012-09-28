class QuestsController < ApplicationController
  # GET /quests
  # GET /quests.json
  def index
    @quests = Quest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quests }
    end
  end

  # GET /quests/1
  # GET /quests/1.json
  def show
    @quest = Quest.find(params[:id])
    @quest.review+=1
    @quest.save
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quest }
    end
  end

  # GET /quests/new
  # GET /quests/new.json
  def new
    @quest = Quest.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quest }
    end
  end

  # GET /quests/1/edit
  def edit
    @quest = Quest.find(params[:id])
  end

  # POST /quests
  # POST /quests.json
  def create
    @quest = Quest.new(params[:quest])
    @quest.likes=0
    @quest.review=0
    if current_user
      @quest.user_id=current_user.id
    else
      @quest.user_id=1
    end      
    respond_to do |format|
      if @quest.save
        format.html { redirect_to @quest, notice: 'Quest was successfully created.' }
        format.json { render json: @quest, status: :created, location: @quest }
      else
        format.html { render action: "new" }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quests/1
  # PUT /quests/1.json
  def update
    @quest = Quest.find(params[:id])

    respond_to do |format|
      if @quest.update_attributes(params[:quest])
        format.html { redirect_to @quest, notice: 'Quest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quests/1
  # DELETE /quests/1.json
  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy

    respond_to do |format|
      format.html { redirect_to quests_url }
      format.json { head :no_content }
    end
  end

  def like
       @quest_params = {
        :id => params[:q_id]  
       }
        @quest= Quest.find(params[:q_id] )
      @quest.likes+=1
      @quest.save()
      @response = {:status => "true",
                           :data => @quest.likes }
    render json: @response    
  end    
end
