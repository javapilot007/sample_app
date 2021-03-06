require 'spec_helper'

describe "MicropostPages" do
  
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do
      it "should not create a micropost" do
        expect { click_button "Post" }.not_to change(Micropost, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        
        it { should have_content('error') } 
      end
    end #"with invalid information"

    describe "with valid information" do
      before { fill_in 'micropost_content', with: "Lorem ipsum" }
      
      it "should create a micropost" do
        expect { click_button "Post" }.to change(Micropost, :count).by(1)
      end
    end #"with valid information"
  end #"micropost creation"
  
  describe "micropost destruction" do
    describe "as correct user" do
      before do
        @micropost = FactoryGirl.create(:micropost, user: user)
        visit root_path
      end

      it { should have_link('delete', href: micropost_path(@micropost)) }
      it "should be able to delete a micropost" do
        expect { click_link "delete" }.to change(Micropost, :count).by(-1)
      end
    end #"as correct user"

    describe "as another user" do
      let(:other_user) { FactoryGirl.create(:user) }
      before do
        @micropost = FactoryGirl.create(:micropost, user: other_user)
        visit user_path(other_user)
      end

      it { should_not have_link('delete', href: micropost_path(@micropost)) }
    end #"as another user"
  end #"micropost destruction"
  
end #"MicropostPages"
