require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe UsersController do

  before :each do
    @user = Factory(:user)
  end

  describe '#index' do

    it 'should return a list of all users' do
      get :index
      response.should be_success
      assigns(:users).should == User.all
    end

  end

end
