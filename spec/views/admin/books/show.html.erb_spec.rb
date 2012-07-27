require 'spec_helper'

describe "admin_books/show" do
  before(:each) do
    @book = assign(:book, stub_model(Admin::Book))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
