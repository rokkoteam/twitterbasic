class TwittsController < ApplicationController
  # GET /twitts
  # GET /twitts.json
  def index
    @twitts = Twitt.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @twitts }
    end
  end

  # GET /twitts/1
  # GET /twitts/1.json
  def show
    @twitt = Twitt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @twitt }
    end
  end

  # GET /twitts/new
  # GET /twitts/new.json
  def new
    @twitt = Twitt.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @twitt }
    end
  end

  # GET /twitts/1/edit
  def edit
    @twitt = Twitt.find(params[:id])
  end

  # POST /twitts
  # POST /twitts.json
  def create
    @twitt = Twitt.new(params[:twitt])
    @twitt.user_id = current_user.id

    respond_to do |format|
      if @twitt.save
        format.html { redirect_to root_path, notice: 'Twitt was successfully created.' }
        format.json { render json: @twitt, status: :created, location: @twitt }
      else
        format.html { render action: "new" }
        format.json { render json: @twitt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /twitts/1
  # PUT /twitts/1.json
  def update
    @twitt = Twitt.find(params[:id])

    respond_to do |format|
      if @twitt.update_attributes(params[:twitt])
        format.html { redirect_to @twitt, notice: 'Twitt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @twitt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitts/1
  # DELETE /twitts/1.json
  def destroy
    @twitt = Twitt.find(params[:id])
    @twitt.destroy

    respond_to do |format|
      format.html { redirect_to twitts_url }
      format.json { head :no_content }
    end
  end
end
