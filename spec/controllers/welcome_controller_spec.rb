require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "#home" do
    it "responds successfully" do
      get :home
      expect(response).to be_success
    end
  end
end
