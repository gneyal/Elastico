require_relative '../../test_helper'
 
describe Elastico::Configuration do
  
  describe "General" do 
    it "must respond to url" do
       Elastico::Configuration.must_respond_to(:url)
    end 
  end
end