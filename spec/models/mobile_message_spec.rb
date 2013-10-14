require 'spec_helper'

describe MobileMessage do

  context 'validations' do
    it { should validate_presence_of(:message) }

    it { should validate_presence_of(:message_type) }
    it { should ensure_inclusion_of(:message_type).in_array(%w(webview alert)) }

    it { should allow_value('https://google.com').for(:url) }
    it { should_not allow_value('htt://google.com').for(:url) }
    it { should allow_value('http://google.com').for(:url) }

    it { should allow_value('5.1.1').for(:platform_version) }
    it { should allow_value('5.0').for(:platform_version) }
    it { should_not allow_value('5').for(:platform_version) }
    it { should allow_value('1.1.1').for(:app_version) }
    it { should allow_value('1.0').for(:app_version) }
    it { should_not allow_value('1').for(:app_version) }
    it { should ensure_inclusion_of(:platform).in_array(%w(android ios)) }
  end

  describe 'for_client' do

    before :each do
      @mobile_message = FactoryGirl.create(:mobile_message)
      @message = MobileMessage.for_client({:platform => @mobile_message.platform,
                                          :platform_version => @mobile_message.platform_version,
                                          :app_version => @mobile_message.app_version}).last
    end

    it 'check platform' do
      @mobile_message.platform.should == 'ios'
    end

    it 'check platform_version' do
      @mobile_message.platform_version.should == @mobile_message.platform_version
    end

    it 'check app_version' do
      @mobile_message.app_version.should == @mobile_message.app_version
    end

    it 'check message_type' do
      @mobile_message.message_type.should == @mobile_message.message_type
    end

    it 'check url' do
      @mobile_message.url.should == @mobile_message.url
    end

    it 'check dismissible' do
      @mobile_message.dismissible.should == @mobile_message.dismissible
    end

    it 'check active' do
      @mobile_message.active.should == @mobile_message.active
    end

  end

end
