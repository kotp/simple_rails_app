class MobileMessagesController < ApplicationController

  # GET /mobile_messages/1
  # GET /mobile_messages/1.json
  def show
    @mobile_message = MobileMessage.find(params[:id])

    respond_to do |format|
      format.json { render json: @mobile_message }
    end
  end

  # GET /mobile_messages/new
  # GET /mobile_messages/new.json
  def new
    @mobile_message = MobileMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mobile_message }
    end
  end


  # POST /mobile_messages
  # POST /mobile_messages.json
  def create
    @mobile_message = MobileMessage.new(params[:mobile_message])

    respond_to do |format|
      if @mobile_message.save
        format.html { redirect_to action: "new", notice: 'Mobile message was successfully created.' }
      else
        format.html { render action: "new", notice: "Mobile message wasn't saved" }
      end
    end
  end

end
