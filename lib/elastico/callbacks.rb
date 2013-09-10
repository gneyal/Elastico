module Elastico
	module Callback
		def self.included(base)
			update_conditions = lambda { update_index_with_instance }

			base.send :after_save, update_conditions
			base.send :after_destroy, update_conditions
        	base.send :after_touch, update_conditions
		end
	end
end



  module Callbacks
    
    def self.included(base)
      update_conditions = lambda do
                            if ElasticSearch.elasticsearch_alive
                              acc_id = self.account_id
                              if LG_FEATURES[:elastic_search].enabled? account_id
                                Spawnling.new do
                                    account = Admin::Account.find(acc_id)
                                    account.connect_to_target_db
                                    update_index_with_instance
                                end
                              end
                            end
                          end

      if AppConfig["enable_tire_callbacks"] && base.respond_to?(:after_save) && base.respond_to?(:after_destroy)
        base.send :after_save,    update_conditions
        base.send :after_destroy, update_conditions
        base.send :after_touch, update_conditions
      end
    end
  end