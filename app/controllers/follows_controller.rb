class FollowsController < ApplicationController
  # GET /follows
  # GET /follows.json
  def index
    @follows = Follow.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @follows }
    end
  end

  # GET /follows/1
  # GET /follows/1.json
  def show
    @follow = Follow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @follow }
    end
  end

  # GET /follows/new
  # GET /follows/new.json
  def new
    @follow = Follow.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @follow }
    end
  end

  # GET /follows/1/edit
  def edit
    @follow = Follow.find(params[:id])
  end

  def follow
    if !Follow.where(:following_id => params[:following_id], :user_id => current_user.id).blank?
      redirect_to root_path
    else
      @follow = Follow.new(:following_id => params[:following_id], :user_id => current_user.id)
      if @follow.save
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
  end

  def un_follow
    if Follow.where(:following_id => params[:following_id], :user_id => current_user.id).blank?
      redirect_to root_path
    else
      @follow = Follow.where(:following_id => params[:following_id], :user_id => current_user.id).first
      if @follow.destroy
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
  end

  # POST /follows
  # POST /follows.json
  def create
    @follow = Follow.new(params[:follow])

    respond_to do |format|
      if @follow.save
        format.html { redirect_to @follow, notice: 'Follow was successfully created.' }
        format.json { render json: @follow, status: :created, location: @follow }
      else
        format.html { render action: "new" }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /follows/1
  # PUT /follows/1.json
  def update
    @follow = Follow.find(params[:id])

    respond_to do |format|
      if @follow.update_attributes(params[:follow])
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.json
  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy

    respond_to do |format|
      format.html { redirect_to follows_url }
      format.json { head :no_content }
    end
  end
end
