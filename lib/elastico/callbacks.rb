module Elastico
	module Callbacks
		def self.included(base)
			update_conditions = lambda { update_index_with_instance }

			base.send :after_save, update_conditions
			base.send :after_destroy, update_conditions
      base.send :after_touch, update_conditions
		end
	end

  def update_index_with_instance
    type = self.class.elastico_type_name
    url = Elastico::Configuration.elastico_url + self.class.elastico_index_name + "/" + type
    instance = self.to_json
    Elastico::Client.general_request(url, instance)
  end
end