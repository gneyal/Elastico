require_relative '../../test_helper'

describe Elastico::Configuration do
  
  describe "General" do 
    it "must respond to url" do
      ThisClass.must_respond_to(:elastico_url)
    end 
  end
end