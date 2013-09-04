require_relative '../../test_helper'
 
describe Elastico::Index do
  
  describe "reading from file" do
 
    it "must have a source" do
       Elastico::Index.must_respond_to(:index_name)
       Elastico::Index.must_respond_to(:type_name)
       Elastico::Index.must_respond_to(:settings_and_mappings_json)
    end 
  end
 
  describe "splitting into lines" do
 
 
  end
 
end