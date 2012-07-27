require 'spec_helper'

describe "admin_books/edit" do
  before(:each) do
    @book = assign(:book, stub_model(Admin::Book))
  end

  it "renders the edit book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_books_path(@book), :method => "post" do
    end
  end
end
