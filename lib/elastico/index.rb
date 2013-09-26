module Elastico
	module Index
		def include_callbacks
			include Elastico::Callbacks
		end

		def settings_and_mappings_json
			@settings_and_mappings_json || nil
		end

		def settings_and_mappings_json= json
			@settings_and_mappings_json = json
		end

		def elastico_index_name
			(@index_name || (self.name.gsub(/::/, "_").pluralize + "_" + Rails.env) ).downcase
		end

		def elastico_index_name= index_name
			@index_name = index_name
		end

		def elastico_type_name
			(@type_name || self.name.gsub(/::/, "_")).downcase
		end

		def elastico_type_name= type_name
			@type_name = type_name
		end

		# This method should be over written in the model that includes elastico
		def prepare_elastico_settings_and_mappings_json
		  nil
  	end
	end
end