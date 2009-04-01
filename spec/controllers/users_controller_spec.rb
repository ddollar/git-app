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

  describe '#new' do
    it 'should create a new User object in @user' do
      get :new
      assigns(:user).new_record?.should be_true
    end

    it 'should successfully render the :new template' do
      get :new
      response.should be_success
      response.should render_template(:new)
    end
  end

  describe '#create' do
    describe 'with valid parameters' do
      before :each do @params = { :user => Factory.attributes_for(:user) } end

      it 'should create the user' do
        post :create, @params
        User.find_by_email(@params[:user][:email]).should_not be_nil
      end

      it 'should redirect to the user list' do
        post :create, @params
        controller.should redirect_to(users_path)
      end

      it 'should have a successful flash message' do
        post :create, @params
        flash[:success].should_not be_blank
      end
    end

    describe 'with invalid parameters' do
      before :each do
        @params = { :user => Factory.attributes_for(:user, :name => '') }
      end

      it 'should not create the user' do
        post :create, @params
        User.find_by_email(@params[:user][:email]).should be_nil
      end

      it 'should render the edit action' do
        post :create, @params
        response.should render_template(:edit)
      end

      it 'should put the invalid User into @user' do
        post :create, @params
        assigns(:user).should be_a(User)
      end

      it 'should have errors on the @user object' do
        post :create, @params
        assigns(:user).should have(1).error_on(:name)
      end
    end
  end

  describe '#edit' do
    it 'should fetch the user object from the id' do
      get :edit, :id => @user.id
      assigns(:user).should == @user
    end

    it 'should render the :edit template successfully' do
      get :edit, :id => @user.id
      response.should be_success
      response.should render_template(:edit)
    end

    it 'should fail when given no id' do
      lambda { get :edit }.should raise_error(ActionController::RoutingError)
    end

    it 'should fail when given an invalid id' do
      lambda { get :edit, :id => 0 }.should raise_error(ActiveRecord::RecordNotFound)
    end
  end
  
  describe '#update' do
    describe 'with valid parameters' do
      before :each do 
        @params = { :id => @user.id, :user => Factory.attributes_for(:user) } 
      end

      it 'should update the user' do
        post :update, @params
        User.find(@params[:id]).email.should == @params[:user][:email]
      end

      it 'should redirect to the user list' do
        post :update, @params
        controller.should redirect_to(users_path)
      end

      it 'should have a successful flash message' do
        post :update, @params
        flash[:success].should_not be_blank
      end
    end

    describe 'with invalid parameters' do
      before :each do
        @params = { :id => @user.id, :user => Factory.attributes_for(:user, :name => '') }
      end

      it 'should not update the user' do
        post :update, @params
        User.find(@params[:id]).email.should_not == @params[:user][:email]
      end

      it 'should render the edit action' do
        post :update, @params
        response.should render_template(:edit)
      end

      it 'should put the invalid User into @user' do
        post :update, @params
        assigns(:user).should be_a(User)
      end

      it 'should have errors on the @user object' do
        post :update, @params
        assigns(:user).should have(1).error_on(:name)
      end
    end  end

end
