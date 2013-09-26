module Elastico
	module Import
		def elastico_import_all
			self.find_each do |instance|
				result = instance.update_index_with_instance_elastico
				logger.info result
			end
			puts "Index for #{self.name} has finished. Errors regarding specific instances have been logged."
		end
	end
end