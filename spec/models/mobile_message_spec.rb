require 'spec_helper'

describe MobileMessage do

  context 'validations' do

    # validate presence
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:message_type) }

    # allowed values
    it { should allow_value('https://github.com/AlexZaytsev/simple_rails_app').for(:url) }
    it { should allow_value('http://github.com/AlexZaytsev/simple_rails_app').for(:url) }
    it { should allow_value('1.1').for(:platform_version) }
    it { should allow_value('1.1.1').for(:platform_version) }
    it { should allow_value('1.1.1').for(:app_version) }

    # not allowed values
    it { should_not allow_value('htt://github.com/AlexZaytsev/simple_rails_app').for(:url) }
    it { should_not allow_value('').for(:app_version) }

    # inclusions
    it { should ensure_inclusion_of(:platform).in_array(%w(android ios)) }
    #it {should ensure_inclusion_of(:platform_version).in_array(%w(1 2 3)).lambda {self.platform == "ios"} }
    it { should ensure_inclusion_of(:message_type).in_array(%w(webview alert)) }


  end

  describe 'for_client' do
    mobile_message = FactoryGirl.create(:mobile_message)
    message = MobileMessage.for_client({:platform => mobile_message.platform,
                                        :platform_version => mobile_message.platform_version,
                                        :app_version => mobile_message.app_version}).last

    it 'check platform' do
      message.platform.should == 'ios'
    end

    it 'check platform_version' do
      message.platform_version.should == mobile_message.platform_version
    end

    it 'check app_version' do
      message.app_version.should == mobile_message.app_version
    end

    it 'check message_type' do
      message.message_type.should == mobile_message.message_type
    end

    it 'check url' do
      message.url.should == mobile_message.url
    end

    it 'check dismissible' do
      message.dismissible.should == mobile_message.dismissible
    end

    it 'check active' do
      message.active.should == mobile_message.active
    end

    message.destroy

  end

end
