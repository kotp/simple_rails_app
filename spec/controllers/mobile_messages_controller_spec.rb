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
        post :create, platform: 'ios', platform_version: 1, app_version: 1.0, message_type: 'alert', url: 'http://github.com/AlexZaytsev/simple_rails_app', message: 'hello world', dismissible: true, active: true
      end

      it { should respond_with(:success) }
      it { should render_template(:new) }
    end

    #context 'should not create message' do
    #
    #  before(:each) do
    #    post :create, platform: 'ios', platform_version: 1, app_version: 1.0, message_type: 'alert'
    #  end
    #
    #  it { should respond_with(:success) }
    #  it { should render_template(:new) }
    #  it { should redirect_to(:new) }
    #end

  end


end
