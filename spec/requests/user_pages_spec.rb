require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "register page" do
    before { visit register_path }

    it { should have_content('Register') }
    it { should have_title('StepUp Demo | Register') }
  end

  describe "register page" do
    before { visit register_path }

    it { should have_content('Register') }
    it { should have_title('StepUp Demo | Register') }
  end

  describe "register" do

    before { visit register_path }

    let(:submit) { "Create My Account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:v1) { FactoryGirl.create(:volunteer, user: user, cause: "Foo") }
    #let!(:v2) { FactoryGirl.create(:volunteer, user: user, content: "Bar") }

    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }

    describe "volunteer profile" do
      #it { should have_content(v1.cause) }
    end
  end  
end
