require 'spec_helper'

describe "admin_publishers/edit" do
  before(:each) do
    @publisher = assign(:publisher, stub_model(Admin::Publisher))
  end

  it "renders the edit publisher form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_publishers_path(@publisher), :method => "post" do
    end
  end
end
