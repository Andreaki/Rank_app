class NamesController < ApplicationController
  # GET /names
  # GET /names.json
  def index
    @names = Name.all(:order => 'votesnumber DESC',
		      :limit => 10
			)
    @others = Name.all(:order => 'created_at DESC',
		      :limit => 10
			)
    @records = Name.all
    @name=Name.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @names }
    end

  end

  # GET /names/1
  # GET /names/1.json
  def show
    @name = Name.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @name }
    end
  end

  # GET /names/new
  # GET /names/new.json
  def new
    @name = Name.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @name }
    end
  end

  # GET /names/1/edit
  def edit
    @name = Name.find(params[:id])
  end

  # POST /names
  # POST /names.json
  def create
    @name = Name.new(params[:name])
    @name.votesnumber=0
    respond_to do |format|
      if @name.save
        format.html { redirect_to @name, notice: 'Name was successfully created.' }
        format.json { render json: @name, status: :created, location: @name }
      else
        format.html { render action: "new" }
        format.json { render json: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /names/1
  # PUT /names/1.json
  def update
    @name = Name.find(params[:id])

    respond_to do |format|
      if @name.update_attributes(params[:name])
        format.html { redirect_to @name, notice: 'Name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /names/1
  # DELETE /names/1.json
  def destroy
    @name = Name.find(params[:id])
    @name.destroy

    respond_to do |format|
      format.html { redirect_to names_url }
      format.json { head :no_content }
    end
  end

  def like
    # Check if a VoteRecord already exists for this ip address, this name, and is a "like",
    # and ignore this vote if so.
    if  VoteRecord.exists?(ip_adress: request.remote_ip, name_id: params[:id], is_like: true)
      # puts "You already voted"
      # @name=Name.find(params[:id])
      # @name.update_attribute(:votesnumber,@name.votesnumber)
      redirect_to root_url, :notice => "Error: You already voted."
    else
      # In the event that a VoteRecord already exists for this name and ip address, use that one.
      @new_vote=VoteRecord.find(:first, conditions: {ip_adress: request.remote_ip, name_id: params[:id]}) ||
        # Otherwise create a new record
        VoteRecord.new(ip_adress: request.remote_ip, name_id: params[:id])
      
      # If the vote didn't exist, and was therefore neutral, make it a like. Otherwise make it neutral.
      @new_vote.is_like=@new_vote.is_like.nil? ? true : false
      # @new_vote.name_id=@name.id
      # @new_vote.ip_adress=request.remote_ip
      @new_vote.save

      @name=Name.find(params[:id])
      @name.update_attribute(:votesnumber,@name.votesnumber+1)

      redirect_to root_url, :notice => "Voted up #{@name.title}."
    end
  end

  def dislike
    # Check if a VoteRecord already exists for this ip address, this name, and is a "dislike",
    # and ignore this vote if so.
    if  VoteRecord.exists?(ip_adress: request.remote_ip, name_id: params[:id], is_like: false)
      # puts "You already voted"
      # @name=Name.find(params[:id])
      # @name.update_attribute(:votesnumber,@name.votesnumber)
      redirect_to root_url, :notice => "Error: You already voted."
    else
      # In the event that a VoteRecord already exists for this name and ip address, use that one.
      @new_vote= VoteRecord.find(:first, conditions: {ip_adress: request.remote_ip, name_id: params[:id]}) ||
        # Otherwise create a new record
        VoteRecord.new(ip_adress: request.remote_ip, name_id: params[:id])
        
      # If the vote didn't exist, and was therefore neutral, make it a dislike. Otherwise make it neutral.
      @new_vote.is_like= @new_vote.is_like.nil? ? false : nil
      # @new_vote.name_id=@name.id
      # @new_vote.ip_adress=request.remote_ip
      @new_vote.save

      @name=Name.find(params[:id])
      @name.update_attribute(:votesnumber,@name.votesnumber-1)

      redirect_to root_url, :notice => "Voted down #{@name.title}."
    end
  end
end
