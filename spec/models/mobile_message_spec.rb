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

end
