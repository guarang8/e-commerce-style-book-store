require_relative File.join('..','..','test_helper')
require 'admin/authors_controller'
class Admin::AuthorControllerTest < ActionController::TestCase
	setup do
		@controller = Admin::AuthorsController.new
		@author = authors(:gauranga)
	end

	test "it should have a valid new method" do
		get :new
		assert_template 'admin/authors/new'
		assert_tag 'h1', :content => 'Create new author'
		assert_tag 'form', :attributes => {:action => '/authors'}
	end

	test "it should have a valid create method" do
		get :new
		assert_template 'admin/authors/new'
		assert_difference('Author.count', 1 ) do
		post :create, :author => { :first_name => 'Manish',
								   :last_name => "Nagrani" }
		assert_response :redirect
		assert_redirected_to authors_path
		end
		assert_equal 'Author Manish Nagrani has been successfully created.', flash[:notice]
	end

	test "a failing create" do
		assert_no_difference('Author.count') do
			post :create, :author => {:first_name => "Manish"}
			assert_response :success
			assert_template 'admin/authors/new'
			assert_tag :tag => 'div', :attributes => { :id => 'error_explanation'}
		end
	end

	test "it has a valid index method" do
		get :index
		assert_response :success
		assert_tag :tag => 'table',
				   :children => {
				   	:count => Author.count+1,
				   	:only => {:tag => 'tr'}
				   }
		Author.find(:all).each do |author|
			assert_select "td",
					       "#{author.first_name} #{author.last_name}"
			#assert_tag :tag => "td",
			#		   :content => author.last_name
		end
	end

	test "it should have valid show method" do
		get :show, :id => 1
		assert_template 'admin/authors/show'
		assert_equal 'Gauranga', assigns(:author).first_name
		assert_equal 'Gaurhari', assigns(:author).last_name
	end

	test "it should have a valid edit page" do
		get :edit, :id => 1
		assert_select 'input', { :name => 'author[last_name]',
								 :value => "Gaurhari" }
	end

	test "it should have a valid update page" do
		post :update, :id => 1, :author => { :first_name => 'Gauranga',
											 :last_name => 'Gaurhari' }
		assert_response :redirect
		assert_redirected_to author_path(:id => 1)
		assert_equal 'Gauranga', Author.find(1).first_name
	end

	test "it should have a valid destroy method" do
		assert_difference('Author.count', -1) do
			post :destroy, :id => 1
			assert_response :redirect
			assert_redirected_to authors_path
		end
	end
end
