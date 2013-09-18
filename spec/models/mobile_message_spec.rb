require 'spec_helper'

describe MobileMessage do

  context 'validations' do

    # validate presence
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:message_type) }

    # allowed values
    it { should allow_value('').for(:platform) }
    it { should allow_value('').for(:platform_version) }
    it { should allow_value('').for(:app_version) }
    it { should allow_value('').for(:app_version) }
    it { should allow_value('https://github.com/AlexZaytsev/simple_rails_app').for(:url) }
    it { should allow_value('http://github.com/AlexZaytsev/simple_rails_app').for(:url) }

    # not allowed values
    it { should_not allow_value('htt://github.com/AlexZaytsev/simple_rails_app').for(:url) }

    # inclusions
    it { should ensure_inclusion_of(:platform).in_array(%w(android ios)) }
    #it {should ensure_inclusion_of(:platform_version).in_array(%w(1 2 3)).lambda {self.platform == "ios"} }
    it { should ensure_inclusion_of(:app_version).in_array(%w(1.0 1.0.1)) }
    it { should ensure_inclusion_of(:message_type).in_array(%w(webview alert)) }


  end

  describe 'for_client' do
    before(:all) do
      @message = FactoryGirl.create(:mobile_message)
    end

    #params = {:platform => 'ios', :platform_version => 1.0, :app_version => 1}
    message = MobileMessage.for_client({:platform => 'ios', :platform_version => '1', :app_version => '1.0'}).last

    it 'check platform' do
      message.platform.should == 'ios'
    end

    it 'check platform_version' do
      message.platform_version.should == '1'
    end

    it 'check app_version' do
      message.app_version.should == '1.0'
    end

    it 'check message_type' do
      message.message_type.should == 'alert'
    end

    it 'check url' do
      message.url.should == 'http://test.com/'
    end

    it 'check dismissible' do
      message.dismissible.should == false
    end

    it 'check active' do
      message.active.should == true
    end

  end

end
