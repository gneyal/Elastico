module Elastico
	class Index
		def self.settings_and_mappings_json
			@settings_and_mappings_json || nil
		end

		def self.settings_and_mappings_json= json
			@settings_and_mappings_json = json
		end

		def self.index_name
			@index_name
		end

		def self.index_name= index_name
			@index_name = index_name
		end

		def self.type_name
			@type_name
		end

		def self.type_name= type_name
			@type_name = type_name
		end	
	end
end