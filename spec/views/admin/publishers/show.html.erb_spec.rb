require 'spec_helper'

describe "admin_publishers/show" do
  before(:each) do
    @publisher = assign(:publisher, stub_model(Admin::Publisher))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
