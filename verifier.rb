class Account

	def initialize(name)
		@name = name
		@balance = 0
	
	end

	def name
		@name
	end

	def balance
		@balance
	end
	
	def new_balance(transaction)
		@balance += transaction
	end

end