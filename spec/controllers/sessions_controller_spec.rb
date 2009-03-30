require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe SessionsController do

  describe '#create' do

    before :each do
      request.env['HTTP_REFERER'] = 'http://example.org/test'
    end

    it 'should authenticate a valid user and store in the session' do
      user = Factory(:user)
      post :create, { :session => { :email => user.email, :password => user.password } }
      session[:user].should == user
    end

    it 'should redirect back after create' do
      post :create
      controller.should redirect_to(:back)
    end

  end

  describe '#destroy' do

    before :each do
      request.env['HTTP_REFERER'] = 'http://example.org/test'
    end

    it 'should remove the user from the session' do
      session[:user] = Factory(:user)
      post :destroy
      session[:user].should be_nil
    end

    it 'should redirect back after destroy' do
      post :destroy
      controller.should redirect_to(:back)
    end

  end

end
