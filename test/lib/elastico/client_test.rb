require_relative '../../test_helper'
 
describe Elastico::Client do
  
  describe "General" do 
    it "should assemble the settings and mapping curl message" do
       Elastico::Configuration.must_respond_to(:create_curl_for_settings_mappings)
    end 
  end
end