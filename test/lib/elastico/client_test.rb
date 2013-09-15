require_relative '../../test_helper'

describe Elastico::Client do
  
  describe "General" do 
    it "should assemble the settings and mapping message" do
       ThisClass.must_respond_to :elastico_url
       ThisClass.must_respond_to :general_request
    end 
  end
end