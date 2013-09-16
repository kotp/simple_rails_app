require 'spec_helper'

describe MobileMessagesController do

  describe 'GET new' do
    context 'should be successful' do

      before(:each) do
        get :new
      end

      it { should respond_with(:success) }
      it { should render_template(:new) }
    end

  end

  describe 'POST create' do
    context 'should create message' do

      before(:each) do
        post :create, mobile_message:{platform: 'ios', platform_version: 1, app_version: 1.0, message_type: 'alert',
                                      url: 'http://github.com/AlexZaytsev/simple_rails_app', message: 'hello world',
                                      dismissible: true, active: true}
      end

      it { should set_the_flash }
      it { should respond_with(:redirect) }
      it { should response.header['Content-Type'].match(/'html'/) }
    end

    context 'should not create message' do

      before(:each) do
        post :create, platform: 'ios', mobile_message:{platform_version: 1, app_version: 1.0, message_type: 'alert'}
      end

      it { should set_the_flash }
      it { should respond_with(:success) }
      it { should render_template(:new) }
      it { should response.header['Content-Type'].match(/'html'/) }
    end

  end

  describe 'GET search' do
    context 'respond with json' do

      before(:each) do
        get :search
      end

      it { should respond_with(:success) }
      it { should response.header['Content-Type'].match(/json/) }
      it { should render_template(:search) }
    end



  end


end
