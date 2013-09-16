require 'spec_helper'

describe "mobile_messages/show" do
  before(:each) do
    @mobile_message = assign(:mobile_message, stub_model(MobileMessage))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
