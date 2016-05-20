require 'rails_helper'
require 'support/violate_check_constraint_matcher'

describe "User" do
  describe "email" do 
    let(:user) { User.create!(email: "foo@shine.com", password: "passwordtenchars", password_confirmation: "passwordtenchars")}

    it "prevents records with email addresses from the wrong domain from being saved" do 
      expect { user.update_attribute(:email, "foo@bar.com")}.to violate_check_constraint(:email_must_be_company_email)
    end
  end
end