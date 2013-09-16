require 'spec_helper'

describe "mobile_messages/edit" do
  before(:each) do
    @mobile_message = assign(:mobile_message, stub_model(MobileMessage))
  end

  it "renders the edit mobile_message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mobile_message_path(@mobile_message), "post" do
    end
  end
end
