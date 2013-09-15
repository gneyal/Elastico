module Elastico
	module Callbacks
		def self.included(base)
			update_conditions = lambda { update_index_with_instance_elastico }

			base.send :after_save, update_conditions
			base.send :after_destroy, update_conditions
      base.send :after_touch, update_conditions
		end

    def update_index_with_instance_elastico
      type = self.class.elastico_type_name
      index = self.class.elastico_index_name
      id = self.id
      url = self.class.elastico_url + index + "/" + type + "/" + id.to_s
      instance = self.to_json
      self.class.general_request(instance, url)
    end
	end
end