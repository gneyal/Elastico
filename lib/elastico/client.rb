module Elastico
	module Client
		def send_settings_mappings_to_elasticsearch_server
			to_url = self.elastico_url + self.elastico_index_name 
			puts to_url
			RestClient.put(to_url, self.settings_and_mappings_json, :content_type => :json, :accept => :json) do |response, request, result|
			  puts JSON.pretty_generate(JSON.parse(response.to_str))
			end
		end

		def general_request(content=nil, url=self.elastico_url, hash_respond_wanted = true)
			RestClient.post(url, content, :content_type => :json, :accept => :json) do |response, request, result|
			  ret = JSON.pretty_generate(JSON.parse(response.to_str))
 				hash_respond_wanted ? JSON.parse(ret) : ret
			end
		end

		def elastico_search(hash_respond_wanted = true)
			to_url = self.elastico_url + self.elastico_index_name + "/_search" 
			response = ""
			RestClient.get(to_url, JSON.parse(self.search_query)) do |response, request, result|
				ret = JSON.pretty_generate(JSON.parse(response.to_str))
				hash_respond_wanted ? JSON.parse(ret) : ret
			end	
		end
	end
end