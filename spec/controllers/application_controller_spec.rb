require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe ApplicationController do

  describe '#current_user' do
    it 'should return the currently logged in user' do
      user = Factory(:user)
      session[:user] = user
      controller.current_user.should == user
    end
  end

  describe '#logged_in?' do
    it 'should be true if there is a current user' do
      session[:user] = Factory(:user)
      controller.logged_in?.should be_true
    end

    it 'should be false if there is no current user' do
      session[:user] = nil
      controller.logged_in?.should be_false
    end
  end

end
