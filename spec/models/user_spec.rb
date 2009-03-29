require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe User do

  before :each do
    @user = Factory(:user)
  end

  describe 'with validations' do
    it { should validate_presence_of(:email)                 }
    it { should validate_presence_of(:name)                  }
    it { should validate_presence_of(:password)              }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_uniqueness_of(:email)               }
  end

  describe 'with a regular user' do
    describe 'while authenticating' do
      it 'should authenticate correctly' do
        User.authenticate(@user.email, @user.password).should == @user
      end

      it 'should not authenticate for invalid credentials' do
        User.authenticate(@user.email, 'bad').should be_nil
      end
    end
  end

  describe 'with an admin user' do
    before :each do @admin = Factory(:user, :admin => true) end
  end

end
