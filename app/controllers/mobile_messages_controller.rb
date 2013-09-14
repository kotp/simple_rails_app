class MobileMessagesController < ApplicationController

  # GET /mobile_messages/1
  # GET /mobile_messages/1.json
  def index
    @mobile_messages = MobileMessage.all
  end

  # GET /mobile_messages/new
  # GET /mobile_messages/new.json
  def new
    @mobile_message = MobileMessage.new
    flash[:notice] = "Mobile message was saved"
  end


  # POST /mobile_messages
  # POST /mobile_messages.json
  def create
    @mobile_message = MobileMessage.new(params[:mobile_message])

    respond_to do |format|
      if @mobile_message.save
        format.html { redirect_to action: "new"}
      else
        flash[:notice] = "Mobile message wasn't saved"
        format.html { render action: "new"}
      end
    end
  end

end
