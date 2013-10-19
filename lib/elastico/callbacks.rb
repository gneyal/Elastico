module Elastico
	module Callbacks
		def self.included(base)
			update_conditions = lambda { update_index_with_instance_elastico }
      destroy_instance = lambda { destroy_instance_in_elastic_search }
			
      base.send :after_save, update_conditions
			base.send :after_destroy, destroy_instance
      base.send :after_touch, update_conditions

      base.send :settings_and_mappings_json=, base.prepare_elastico_settings_and_mappings_json
      # base.send :send_settings_mappings_to_elasticsearch_server
		end

    def update_index_with_instance_elastico
      type = self.class.elastico_type_name
      index = self.class.elastico_index_name
      id = self.id
      url = self.class.elastico_url + index + "/" + type + "/" + id.to_s
      if self.respond_to? :elastico_to_indexed_json
        instance = self.elastico_to_indexed_json
      else
        instance = self.to_json 
      end
      self.class.general_request(instance, url)
    end

    def destroy_instance_in_elastic_search
      type = self.class.elastico_type_name
      index = self.class.elastico_index_name
      id = self.id
      url = self.class.elastico_url + index + "/" + type + "/" + id.to_s
      self.class.delete_instance(url)
    end
	end
end