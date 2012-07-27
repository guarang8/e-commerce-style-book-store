require 'spec_helper'

describe "admin_books/new" do
  before(:each) do
    assign(:book, stub_model(Admin::Book).as_new_record)
  end

  it "renders new book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_books_path, :method => "post" do
    end
  end
end
