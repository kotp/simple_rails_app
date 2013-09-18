class MobileMessagesController < ApplicationController

  # GET /mobile_messages/1
  # GET /mobile_messages/1.json
  def index
    @mobile_messages = MobileMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mobile_messages }
    end
  end

  # GET /mobile_messages/1
  # GET /mobile_messages/1.json
  def show
    @mobile_message = MobileMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /mobile_messages/new
  # GET /mobile_messages/new.json
  def new
    @mobile_message = MobileMessage.new
    flash[:notice] = "Mobile message was saved"
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /mobile_messages/1/edit
  def edit
    @mobile_message = MobileMessage.find(params[:id])
  end

  # POST /mobile_messages
  # POST /mobile_messages.json
  def create
    @mobile_message = MobileMessage.new(params[:mobile_message])

    respond_to do |format|
      if @mobile_message.save
        format.html { redirect_to @mobile_message, notice: 'Mobile message was successfully created.' }
      else
        flash[:notice] = "Mobile message wasn't saved"
        format.html { render action: "new"}
      end
    end
  end

  # PUT /mobile_messages/1
  # PUT /mobile_messages/1.json
  def update
    @mobile_message = MobileMessage.find(params[:id])

    respond_to do |format|
      if @mobile_message.update_attributes(params[:mobile_message])
        format.html { redirect_to @mobile_message, notice: 'Mobile message was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /mobile_messages/1
  # DELETE /mobile_messages/1.json
  def destroy
    @mobile_message = MobileMessage.find(params[:id])
    @mobile_message.destroy

    respond_to do |format|
      format.html { redirect_to mobile_messages_url }
    end
  end


  def search
    @mobile_messages = MobileMessage.for_client(params)
  end

end
