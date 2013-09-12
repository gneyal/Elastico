module Elastico
	module Index
		def settings_and_mappings_json
			@settings_and_mappings_json || nil
		end

		def settings_and_mappings_json= json
			@settings_and_mappings_json = json
		end

		def elastico_index_name
			(self.name.gsub(/::/, "_") || @index_name).downcase + "_elastico"
		end

		def elastico_index_name= index_name
			@index_name = index_name
		end

		def elastico_type_name
			(self.name.gsub(/::/, "_") || @type_name).downcase
		end

		def elastico_type_name= type_name
			@type_name = type_name
		end	
	end
end