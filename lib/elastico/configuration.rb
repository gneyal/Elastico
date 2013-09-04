module Elastico
	class Configuration
		def self.url
			@url || nil
		end

		def self.url= url
			@url = url
		end
	end
end