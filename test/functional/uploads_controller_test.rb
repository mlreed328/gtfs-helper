require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  context 'the controller' do
    context "get to new" do
      setup{ get :new }
      should_respond_with :success
      should_assign_to :upload
    end
    context "post to create" do
      setup do
        post :create, :upload => {:data => File.open(File.join('test', 'fixtures', 'test_data.zip'))}
      end
      should_assign_to :upload
      should_redirect_to("root path") { root_path }
    end
  end
end
