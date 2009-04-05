require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe RepositoriesController do

  before :each do
    @repository = Factory(:repository)
  end

  describe '#index' do
    it 'should return a list of all repositories' do
      get :index
      response.should be_success
      assigns(:repositories).should == Repository.all
    end
  end

  describe '#new' do
    it 'should create a new Repository object in @repository' do
      get :new
      assigns(:repository).new_record?.should be_true
    end

    it 'should successfully render the :new template' do
      get :new
      response.should be_success
      response.should render_template(:new)
    end
  end

  describe '#create' do
    describe 'with valid parameters' do
      before :each do @params = { :repository => Factory.attributes_for(:repository) } end

      it 'should create the repository' do
        post :create, @params
        Repository.find_by_name(@params[:repository][:name]).should_not be_nil
      end

      it 'should redirect to the repository list' do
        post :create, @params
        controller.should redirect_to(repositories_path)
      end

      it 'should have a successful flash message' do
        post :create, @params
        flash[:success].should_not be_blank
      end
    end

    describe 'with invalid parameters' do
      before :each do
        @params = { :repository => Factory.attributes_for(:repository, :name => '') }
      end

      it 'should not create the repository' do
        post :create, @params
        Repository.find_by_name(@params[:repository][:name]).should be_nil
      end

      it 'should render the edit action' do
        post :create, @params
        response.should render_template(:edit)
      end

      it 'should put the invalid Repository into @repository' do
        post :create, @params
        assigns(:repository).should be_a(Repository)
      end

      it 'should have errors on the @repository object' do
        post :create, @params
        assigns(:repository).should have(1).error_on(:name)
      end
    end
  end

  describe '#edit' do
    it 'should fetch the repository object from the id' do
      get :edit, :id => @repository.id
      assigns(:repository).should == @repository
    end

    it 'should render the :edit template successfully' do
      get :edit, :id => @repository.id
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
        @params = { :id => @repository.id, :repository => Factory.attributes_for(:repository) }
      end

      it 'should update the repository' do
        post :update, @params
        Repository.find(@params[:id]).name.should == @params[:repository][:name]
      end

      it 'should redirect to the repository list' do
        post :update, @params
        controller.should redirect_to(repositories_path)
      end

      it 'should have a successful flash message' do
        post :update, @params
        flash[:success].should_not be_blank
      end
    end

    describe 'with invalid parameters' do
      before :each do
        @params = { :id => @repository.id, :repository => Factory.attributes_for(:repository, :name => '') }
      end

      it 'should not update the repository' do
        post :update, @params
        Repository.find(@params[:id]).name.should_not == @params[:repository][:name]
      end

      it 'should render the edit action' do
        post :update, @params
        response.should render_template(:edit)
      end

      it 'should put the invalid Repository into @repository' do
        post :update, @params
        assigns(:repository).should be_a(Repository)
      end

      it 'should have errors on the @repository object' do
        post :update, @params
        assigns(:repository).should have(1).error_on(:name)
      end
    end
  end

end
