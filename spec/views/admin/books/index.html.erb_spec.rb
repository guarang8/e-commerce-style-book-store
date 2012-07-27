require 'spec_helper'

describe "admin_books/index" do
  before(:each) do
    assign(:admin_books, [
      stub_model(Admin::Book),
      stub_model(Admin::Book)
    ])
  end

  it "renders a list of admin_books" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
