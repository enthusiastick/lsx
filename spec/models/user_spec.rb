require 'spec_helper'

describe User do

  describe "Database Tests" do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:encrypted_password).of_type(:string) }
    it { should have_db_column(:handle).of_type(:string) }
  end

  describe "Validation Tests" do
    it { should have_valid(:email).when("foob@example.net") }
    it { should_not have_valid(:email).when(nil, "", "heather") }
    it { should have_valid(:handle).when("blahdebloo") }
    it { should_not have_valid(:handle).when(nil, "") }
  end

  describe "Association Tests" do
  end

end
