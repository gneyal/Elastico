module Elastico
	class Client
		def self.create_curl_for_settings_mappings
			message = "curl -XPOST '" + 
			Elastico::Configuration.url + Elastico::Index.index_name + 
			"' -d '" + 
			Elastico::Index.settings_and_mappings_json +
			"'"
		end

		def self.send_settings_mappings_to_elasticsearch_server
			message = self.create_curl_for_settings_mappings
			response = system("#{message}")
			response
		end

		def self.send_anything_to_elasticsearch_server(url=Elastico::Configuration.url, content)
		end
	end
end