module Elastico
	module Configuration
		def elastico_url
			@url || "http://localhost:9200/"
		end

		def elastico_url= url
			@url = url
		end
	end
end