require_relative "./elastico/configuration"
require_relative "./elastico/version"
require_relative "./elastico/index"
require_relative "./elastico/client"


module Elastico
  # Your code goes here...
    
	def self.included(base)
    	base.extend Configuration
    	base.extend Index
		base.extend Client
  	end
end
