require_relative '../../test_helper'

describe Elastico::Index do
  
  describe "reading from file" do
 
    it "must respond to these class methods" do
       ThisClass.must_respond_to(:settings_and_mappings_json)
       ThisClass.must_respond_to(:elastico_index_name)
       ThisClass.must_respond_to(:elastico_type_name)
    end 
  end
end