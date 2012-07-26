require 'spec_helper'

describe "admin_publishers/index" do
  before(:each) do
    assign(:admin_publishers, [
      stub_model(Admin::Publisher),
      stub_model(Admin::Publisher)
    ])
  end

  it "renders a list of admin_publishers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
