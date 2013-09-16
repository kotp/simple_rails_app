require 'spec_helper'

describe "mobile_messages/new" do
  before(:each) do
    assign(:mobile_message, stub_model(MobileMessage).as_new_record)
  end

  it "renders new mobile_message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mobile_messages_path, "post" do
    end
  end
end
