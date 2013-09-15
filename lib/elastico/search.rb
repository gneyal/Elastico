module Elastico
	module Search
		def search_query
			@search_query || nil
		end

		def search_query= json
			@search_query = json
		end
	end
end