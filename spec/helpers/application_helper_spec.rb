require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationHelper do

  include ActionController::UrlWriter

  it 'should be included in the object returned by #helper' do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(ApplicationHelper)
  end

  before :each do extend ApplicationHelper end

  describe '#flash_messages' do
    it 'should render the flash partial' do
      should_receive(:render).with('layouts/flash', :flash => flash)
      flash_messages
    end
  end

  describe '#current_user' do
    it 'should return the currently logged in user' do
      user = Factory(:user)
      session[:user] = user
      current_user.should == user
    end
  end

end
