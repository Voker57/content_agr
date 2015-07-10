module ScrapeUtils
	def self.new_mechanize
		Mechanize.new { |agent|
				agent.history.max_size=1
				agent.open_timeout = 15
				agent.read_timeout = 15
				agent.user_agent_alias = 'Mac Safari'
			}
	end
	
	# Attempts to GET page, retries up to 5 times on errors, lets 404's fall through
	
	def self.get(www, *args)
# 		p(["GET"] + args) 
		self.smart_www_action do
			www.get *args
		end
	end
	
	# Cf self.get
	def self.post(www, *args)
		self.smart_www_action do
			www.post *args
		end
	end
	
	# low-level code for smart Mechanize action
	def self.smart_www_action(&blk)
		attempts = 3
		begin
			blk.call
		rescue Mechanize::ResponseCodeError => e
			if e.response_code == "404"
				raise e
			else
				attempts -= 1
				if attempts <= 0
					raise e
				else
					retry
				end
			end
		rescue => e
			attempts -= 1
			if attempts <= 0
				raise e
			else
				retry
			end
		end
	end
end