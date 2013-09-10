module Elastico
	module Client
		def send_settings_mappings_to_elasticsearch_server
			to_url = self.elastico_url + self.elastico_index_name
			RestClient.post(to_url, self.settings_and_mappings_json, :content_type => :json, :accept => :json) do |response, request, result|
			  puts JSON.pretty_generate(JSON.parse(response.to_str))
			end
		end

		def send_anything_to_elasticsearch_server(url=Elastico::Configuration.url, content)
		end
	end
end

