require_relative "./elastico/configuration"
require_relative "./elastico/version"
require_relative "./elastico/callbacks"
require_relative "./elastico/index"
require_relative "./elastico/search"
require_relative "./elastico/client"


module Elastico
	def self.included(base)
  	base.extend Configuration
  	base.extend Index
  	base.extend Search
		base.extend Client

		base.send :include_callbacks
	end
end
