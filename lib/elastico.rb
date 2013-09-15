require_relative "./elastico/configuration"
require_relative "./elastico/version"
require_relative "./elastico/index"
require_relative "./elastico/search"
require_relative "./elastico/client"


module Elastico
  # Your code goes here...
    
    # making these modules class modules - meaning that the traits they define are set as class traits (not instance traits)
	def self.included(base)
    	base.extend Configuration
    	base.extend Index
    	base.extend Search
		base.extend Client
  	end
end
