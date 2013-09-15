require_relative '../../test_helper'

describe Elastico::Search do
  
  describe "Search" do
 
    it "must respond to these class methods" do
       ThisClass.must_respond_to(:search_query)
    end 
  end
end